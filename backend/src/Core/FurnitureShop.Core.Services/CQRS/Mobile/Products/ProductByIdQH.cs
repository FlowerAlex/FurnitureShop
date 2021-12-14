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
    public class ProductByIdQH : IQueryHandler<ProductById, ProductDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ProductByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ProductDTO?> ExecuteAsync(CoreContext context, ProductById query)
        {
            return await dbContext.Products
                .Where(p => p.Id == query.ProductId)
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
                })
                .FirstOrDefaultAsync();
        }
    }
}
