using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class GetAllProductsQH : IQueryHandler<GetAllProducts, List<ProductDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllProductsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<List<ProductDTO>> ExecuteAsync(CoreContext context, GetAllProducts query)
        {
            if (query.CategoryId.HasValue)
            {
                return await dbContext.Products
                   .Where(p => p.CategoryId == query.CategoryId)
                   .Select(p => new ProductDTO
                   {
                       ProductInfo = new ProductInfoDTO
                       {
                           Name = p.Name,
                           Description = p.Description,
                           Price = p.Price,
                           ModelUrl = p.ModelUrl,
                       },
                       Id = p.Id,
                   }).ToListAsync();
            }
            else
            {
                return await dbContext.Products
                    .Select(p => new ProductDTO
                    {
                        ProductInfo = new ProductInfoDTO
                        {
                            Name = p.Name,
                            Description = p.Description,
                            Price = p.Price,
                            ModelUrl = p.ModelUrl,
                        },
                        Id = p.Id,
                    }).ToListAsync();
            }
        }
    }
}
