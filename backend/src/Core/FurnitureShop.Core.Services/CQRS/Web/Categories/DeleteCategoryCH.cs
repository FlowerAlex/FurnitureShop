using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Web.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Categories
{
    public class DeleteCategoryCH : ICommandHandler<DeleteCategory>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<DeleteCategoryCH>();
        private readonly CoreDbContext dbContext;

        public DeleteCategoryCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, DeleteCategory command)
        {
            var category = await dbContext.Categories
                .Where(c => c.Id == command.Id)
                .FirstOrDefaultAsync();
            if (category == null)
            {
                return;
            }

            dbContext.Categories.Remove(category);
            await dbContext.SaveChangesAsync();
        }
    }
}
