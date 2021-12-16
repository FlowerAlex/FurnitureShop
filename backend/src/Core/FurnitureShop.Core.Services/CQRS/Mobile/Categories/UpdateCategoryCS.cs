using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Categories
{
    public class UpdateCategoryCH : ICommandHandler<UpdateCategory>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<UpdateCategoryCH>();
        private readonly CoreDbContext dbContext;
        public UpdateCategoryCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateCategory command)
        {
            var category = await dbContext.Categories.Where(c => c.Id == command.Id).FirstOrDefaultAsync();
            if (category == null)
            {
                return;
            }

            category.Name = command.NewName;
            dbContext.Categories.Update(category);
            await dbContext.SaveChangesAsync();
        }
    }
}
