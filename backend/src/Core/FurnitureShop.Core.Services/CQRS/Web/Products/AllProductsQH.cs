using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Shared.Products;
using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Products
{
    public class AllProductsQH
        : IQueryHandler<
            FurnitureShop.Core.Contracts.Web.Products.AllProducts,
            PaginatedResult<ProductDTO>
        >
    {
        private readonly CoreDbContext dbContext;

        public AllProductsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ProductDTO>> ExecuteAsync(
            CoreContext context,
            FurnitureShop.Core.Contracts.Web.Products.AllProducts query
        )
        {
            if (query.CategoryId.HasValue)
            {
                return await dbContext.Products
                    .Where(p => p.CategoryId == query.CategoryId)
                    .GetProducts(query);
            }
            else
            {
                return await dbContext.Products.GetProducts(query);
            }
        }
    }

    internal static class ProductQHExtensions
    {
        public async static Task<PaginatedResult<ProductDTO>> GetProducts(
            this IQueryable<Product> queryable,
            FurnitureShop.Core.Contracts.Web.Products.AllProducts query
        )
        {
            return await queryable
                .FilterBy(query)
                .Include(p => p.Reviews)
                .Select(
                    p =>
                        new ProductDTO
                        {
                            Name = p.Name,
                            Price = p.Price,
                            PreviewPhotoId = p.PreviewPhotoId,
                            Description = p.Description,
                            AverageRating =
                                p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                            CategoryId = p.CategoryId,
                            Id = p.Id,
                        }
                )
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }

        public static IQueryable<Product> FilterBy(
            this IQueryable<Product> queryable,
            FurnitureShop.Core.Contracts.Web.Products.AllProducts query
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
            FurnitureShop.Core.Contracts.Web.Products.AllProducts query
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
                _ => queryable
            };
        }
    }
}
