using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Web.Categories
{
    public class UpdateCategoryCV : ContextualValidator<UpdateCategory>
    {
        public UpdateCategoryCV()
        {
            RuleFor(p => p.NewName)
                .NotEmpty()
                    .WithCode(UpdateCategory.ErrorCodes.IncorrectName)
                    .WithMessage("Category name should not be empty");
        }
    }
    
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
