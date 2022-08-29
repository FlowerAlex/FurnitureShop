using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
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

        public async Task<PaginatedResult<ProductDTO>> ExecuteAsync(CoreContext context, AllProducts query)
        {
            if (query.CategoryId.HasValue)
            {
                return await GetProducts(dbContext.Products.Where(p => p.CategoryId == query.CategoryId), query, context);
            }
            else
            {
                return await GetProducts(dbContext.Products, query, context);
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
                .Where(shp => shp.ShoppingCartId == shoppingCartId)
                .Select(shp => shp.ProductId!.Value).ToListAsync();
        }
        private async Task<List<Guid>> GetProductsInFavourites(CoreContext context)
        {
            return await dbContext.Favourites
                .Where(f => f.UserId == context.UserId && f.ProductId != null)
                .Select(f => f.ProductId!.Value).ToListAsync();
        }
        private async Task<PaginatedResult<ProductDTO>> GetProducts(IQueryable<Product> queryable, AllProducts query, CoreContext context)
        {
            var productsInShoppingCart = await GetProductsInShoppingCart(context);
            var productsInFavourites = await GetProductsInFavourites(context);

            return await queryable.FilterBy(query)
                .Include(p => p.Reviews)
                .Select(p => new ProductDTO
                {
                    Name = p.Name,
                    Price = p.Price,
                    PreviewPhotoId = p.PreviewPhotoId,
                    AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                    CategoryId = p.CategoryId,
                    InFavourites = productsInFavourites.Contains(p.Id),
                    InShoppingCart = productsInShoppingCart.Contains(p.Id),
                    Id = p.Id,
                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }

    internal static class ProductQHExtensions
    {
        public static IQueryable<Product> FilterBy(this IQueryable<Product> queryable, AllProducts query)
        {
            return query.FilterBy switch
            {
                string f => queryable.Where(c => c.Name.ToLower().Contains(f.ToLowerInvariant())),
                _ => queryable,
            };
        }

        public static IQueryable<ProductDTO> SortBy(this IQueryable<ProductDTO> queryable, AllProducts query)
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                ProductsSortFieldDTO.Name => queryable.OrderBy(s => s.Name, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Rating => queryable.OrderBy(s => s.AverageRating, query.SortByDescending).ThenBy(s => s.Id),
                ProductsSortFieldDTO.Price => queryable.OrderBy(s => s.Price, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable,
            };
        }
    }
}
