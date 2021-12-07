using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Categories
{
    public class CreateCategoryCH : ICommandHandler<AddCategory>
    {
        private readonly CoreDbContext dbContext;
        public CreateCategoryCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, AddCategory command)
        {
            var result = await dbContext.Categories.AddAsync(
                new Category(command.CategoryName));
        }
    }
}
