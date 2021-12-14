using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class DeleteProductCH : ICommandHandler<DeleteProduct>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<DeleteProductCH>();
        private readonly CoreDbContext dbContext;
        public DeleteProductCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, DeleteProduct command)
        {
            var product = await dbContext.Products.Where(c => c.Id == command.ProductId).FirstOrDefaultAsync();
            if (product == null)
            {
                return;
            }

            dbContext.Products.Remove(product);
        }
    }
}
