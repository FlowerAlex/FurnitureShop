using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts;
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
            return await dbContext.Products
                .FilterBy(query)
                .Where(p => p.CategoryId == query.CategoryId)
                .Select(p => new ProductDTO
                {
                    ProductInfo = new ProductInfoDTO
                    {
                        Name = p.Name,
                        Price = p.Price,
                        PreviewPhotoURL = p.ModelUrl,
                        AvergeRating = p.Reviews.Average(r => r.Rating),
                        CategoryId = p.CategoryId,
                    },
                    Id = p.Id,
                }
                )
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }
    internal static class CollectionsListQHExtensions
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
            return query.SortBy switch
            {
                ProductsSortFieldDTO.Rating => queryable.OrderBy(s => s.ProductInfo.AvergeRating, query.SortByDescending),
                _ => queryable.OrderBy(s => s.ProductInfo.Name, query.SortByDescending),
            };
        }
    }
}
