using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Web.Categories
{
    public class CreateCategoryCV : ContextualValidator<CreateCategory>
    {
        public CreateCategoryCV()
        {
            RuleFor(p => p.CategoryName)
                .NotEmpty()
                    .WithCode(CreateCategory.ErrorCodes.IncorrectName)
                    .WithMessage("Category name should not be empty");
        }
    }
    
    public class CreateCategoryCH : ICommandHandler<CreateCategory>
    {
        private readonly CoreDbContext dbContext;
        public CreateCategoryCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateCategory command)
        {
            var result = await dbContext.Categories.AddAsync(
                new Category(command.CategoryName));
            await dbContext.SaveChangesAsync();
        }
    }
}
