using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Favourites;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Shared.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Favourites
{
    public class MyFavouritesQH : IQueryHandler<MyFavourites, PaginatedResult<ProductDTO>>
    {
        private readonly CoreDbContext dbContext;

        public MyFavouritesQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ProductDTO>> ExecuteAsync(
            CoreContext context,
            MyFavourites query
        )
        {
            var productsInShoppingCart = await context.GetProductsInShoppingCart(dbContext);
            var productsInFavourites = await context.GetProductsInFavourties(dbContext);

            var filteredProducts = dbContext.Products
                .FilterBy(query)
                .Where(p => productsInFavourites.Contains(p.Id));

            if (query.CategoryId.HasValue)
            {
                filteredProducts = filteredProducts.Where(p => p.CategoryId == query.CategoryId);
            }

            var result = await filteredProducts
                .Include(p => p.Reviews)
                .Select(
                    p =>
                        new ProductDTO
                        {
                            Name = p.Name,
                            Price = p.Price,
                            PreviewPhotoId = p.PreviewPhotoId,
                            AverageRating =
                                p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                            CategoryId = p.CategoryId,
                            Description = p.Description,
                            InFavourites = true,
                            InShoppingCart = productsInShoppingCart.Contains(p.Id),
                            Id = p.Id,
                        }
                )
                .SortBy(query)
                .ToPaginatedResultAsync(query);
            return result;
        }
    }

    internal static class ProductQHExtensions
    {
        public static IQueryable<Product> FilterBy(
            this IQueryable<Product> queryable,
            MyFavourites query
        )
        {
            return query.FilterBy switch
            {
                string f => queryable.Where(c => c.Name.ToLower().Contains(f.ToLowerInvariant())),
                _ => queryable,
            };
        }

        public static IQueryable<ProductDTO> SortBy(
            this IQueryable<ProductDTO> queryable,
            MyFavourites query
        )
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                ProductsSortFieldDTO.Name
                    => queryable.OrderBy(s => s.Name, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Rating
                    => queryable
                        .OrderBy(s => s.AverageRating, query.SortByDescending)
                        .ThenBy(s => s.Id),
                ProductsSortFieldDTO.Price
                    => queryable.OrderBy(s => s.Price, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable,
            };
        }
    }
}
