using System.Threading.Tasks;
using FluentValidation;
using FluentValidation.Validators;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class CreateProductCV : ContextualValidator<CreateProduct>
    {
        public CreateProductCV()
        {
            RuleFor(p => p.ProductDetails.ProductInfo.Name)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Product name should not be empty");
            RuleFor(p => p.ProductDetails.ProductInfo.Price)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Price should not be empty")
                .GreaterThan(0)
                    .WithCode(CreateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Price should be a positive number");
            RuleFor(p => p.ProductDetails.Description)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Product description should not be empty");  
        }
    }
    public class CreateProductCH : ICommandHandler<CreateProduct>
    {
        private readonly CoreDbContext dbContext;
        public CreateProductCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateProduct command)
        {
            var result = await dbContext.Products.AddAsync(
                new Product(command.ProductDetails.ProductInfo.Name, command.ProductDetails.Description, command.ProductDetails.ProductInfo.Price)
                {
                    ModelUrl = command.ProductDetails.ModelUrl,
                    CategoryId = Id<Category>.From(command.ProductDetails.ProductInfo.CategoryId),
                    PreviewPhotoUrl = command.ProductDetails.ProductInfo.PreviewPhotoURL,
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
