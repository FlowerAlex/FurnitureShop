using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class GetAllProductsQH : IQueryHandler<GetAllProducts, PaginatedResult<ProductDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllProductsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ProductDTO>> ExecuteAsync(CoreContext context, GetAllProducts query)
        {
            var productsInShoppingCart = await GetProductsInShoppingCart(context);
            var productsInFavourites = await GetProductsInFavourites(context);

            if (query.CategoryId.HasValue)
            {
                return await dbContext.Products
                .FilterBy(query)
                .Where(p => p.CategoryId == query.CategoryId)
                .Include(p => p.Reviews)
                .Select(p => new ProductDTO
                {
                    ProductInfo = new ProductInfoDTO
                    {
                        Name = p.Name,
                        Price = p.Price,
                        PreviewPhotoURL = p.ModelUrl,
                        AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                        CategoryId = p.CategoryId,
                        InFavourites = productsInFavourites.Contains(p.Id),
                        InShoppingCart = productsInShoppingCart.Contains(p.Id),
                    },
                    Id = p.Id,
                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
            }
            else
            {
                return await dbContext.Products
                .FilterBy(query)
                .Include(p => p.Reviews)
                .Select(p => new ProductDTO
                {
                    ProductInfo = new ProductInfoDTO
                    {
                        Name = p.Name,
                        Price = p.Price,
                        PreviewPhotoURL = p.ModelUrl,
                        AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                        CategoryId = p.CategoryId,
                        InFavourites = productsInFavourites.Contains(p.Id),
                        InShoppingCart = productsInShoppingCart.Contains(p.Id),
                    },
                    Id = p.Id,
                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
            }
        }

        private async Task<List<Guid>> GetProductsInShoppingCart(CoreContext context)
        {
            var shoppingCart = dbContext.ShoppingCarts.Where(sh => sh.UserId == context.UserId).FirstOrDefault();
            if (shoppingCart == null)
            {
                return new List<Guid>();
            }
            var shoppingCartId = shoppingCart.Id;
            return await dbContext.ShoppingCartProduct
                .Where(shp => shp.ShoppingCartId == shoppingCartId && shp.ProductId != null)
                .Select(shp => shp.ProductId!.Value.Value).ToListAsync();
        }
        private async Task<List<Guid>> GetProductsInFavourites(CoreContext context)
        {
            return await dbContext.Favourites
                .Where(f => f.UserId == context.UserId && f.ProductId != null)
                .Select(f => f.ProductId!.Value.Value).ToListAsync();
        }
    }

    internal static class ProductQHExtensions
    {
        public static IQueryable<Product> FilterBy(this IQueryable<Product> queryable, GetAllProducts query)
        {
            return query.FilterBy switch
            {
                string f => queryable.Where(c => c.Name.ToLower().Contains(f.ToLowerInvariant())),
                _ => queryable,
            };
        }

        public static IQueryable<ProductDTO> SortBy(this IQueryable<ProductDTO> queryable, GetAllProducts query)
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                ProductsSortFieldDTO.Name => queryable.OrderBy(s => s.ProductInfo.Name, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Rating => queryable.OrderBy(s => s.ProductInfo.AverageRating, query.SortByDescending),
                ProductsSortFieldDTO.Price => queryable.OrderBy(s => s.ProductInfo.Price, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable
            };
        }
    }
}
