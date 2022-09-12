using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Shared.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class AllProductsQH : IQueryHandler<AllProducts, PaginatedResult<ProductDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllProductsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ProductDTO>> ExecuteAsync(
            CoreContext context,
            AllProducts query
        )
        {
            if (query.CategoryId.HasValue)
            {
                return await GetProducts(
                    dbContext.Products.Where(p => p.CategoryId == query.CategoryId),
                    query,
                    context
                );
            }
            else
            {
                return await GetProducts(dbContext.Products, query, context);
            }
        }

        private async Task<PaginatedResult<ProductDTO>> GetProducts(
            IQueryable<Product> queryable,
            AllProducts query,
            CoreContext context
        )
        {
            var productsInShoppingCart = await context.GetProductsInShoppingCart(dbContext);
            var productsInFavourites = await context.GetProductsInFavourties(dbContext);

            return await queryable
                .FilterBy(query)
                .Include(p => p.Reviews)
                .Select(
                    p =>
                        new ProductDTO
                        {
                            Name = p.Name,
                            Price = p.Price,
                            Description = p.Description,
                            PreviewPhotoId = p.PreviewPhotoId,
                            AverageRating =
                                p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                            CategoryId = p.CategoryId,
                            InFavourites = productsInFavourites.Contains(p.Id),
                            InShoppingCart = productsInShoppingCart.Contains(p.Id),
                            Id = p.Id,
                        }
                )
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }

    internal static class ProductQHExtensions
    {
        public static IQueryable<Product> FilterBy(
            this IQueryable<Product> queryable,
            AllProducts query
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
            AllProducts query
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
