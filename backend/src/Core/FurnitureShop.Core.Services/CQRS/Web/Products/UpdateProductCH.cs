using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Products
{
    public class UpdateProductCV : ContextualValidator<UpdateProduct>
    {
        public UpdateProductCV()
        {
            RuleFor(p => p.ProductDetails.Name)
                .NotEmpty()
                    .WithCode(UpdateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Product name should not be empty");
            RuleFor(p => p.ProductDetails.Price)
                .NotEmpty()
                    .WithCode(UpdateProduct.ErrorCodes.IncorrectPrice)
                    .WithMessage("Price should not be empty")
                .GreaterThan(0)
                    .WithCode(UpdateProduct.ErrorCodes.IncorrectPrice)
                    .WithMessage("Price should be a positive number");
            RuleFor(p => p.ProductDetails.Description)
                .NotEmpty()
                    .WithCode(UpdateProduct.ErrorCodes.IncorrectDescription)
                    .WithMessage("Product description should not be empty");
        }
    }

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
            var product = await dbContext.Products.Where(c => c.Id == command.Id).FirstOrDefaultAsync();
            if (product == null)
            {
                return;
            }

            var updated = command.ProductDetails;
            product.Name = updated.Name;
            product.Description = updated.Description;
            product.Price = updated.Price;
            product.ModelUrl = command.ProductDetails.ModelUrl;
            product.CategoryId = Id<Category>.From(updated.CategoryId);
            product.PreviewPhotoUrl = updated.PreviewPhotoURL;

            dbContext.Products.Update(product);
            await dbContext.SaveChangesAsync();
        }
    }
}
