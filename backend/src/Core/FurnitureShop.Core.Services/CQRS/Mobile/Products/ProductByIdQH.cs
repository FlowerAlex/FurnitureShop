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
                    Name = "exampleName",
                    Description = "exampleDesc",
                    Price = 12,
                    ModelUrl = "someUrl",
                    Id = Guid.Parse("190937ca-884e-42ec-ae96-48abc925c1d9"),
                })
                .FirstOrDefaultAsync();
        }
    }
}
