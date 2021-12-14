using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class UpdateProductCH : ICommandHandler<UpdateProduct>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<UpdateProductCH>();
        private readonly CoreDbContext dbContext;
        public UpdateProductCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateProduct command)
        {
            var product = await dbContext.Products.Where(c => c.Id == command.UpdatedProduct.Id).FirstOrDefaultAsync();
            if (product == null)
            {
                return;
            }

            var updated = command.UpdatedProduct.ProductInfo;
            product.Name = updated.Name;
            product.Description = updated.Description;
            product.Price = updated.Price;
            product.CategoryId = Id<Category>.From(updated.CategoryId);

            dbContext.Products.Update(product);
        }
    }
}
