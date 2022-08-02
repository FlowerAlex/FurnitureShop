using System;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Web.Products
{
    public class CreateProductCV : ContextualValidator<CreateProduct>
    {
        public CreateProductCV()
        {
            RuleFor(p => p.NewProduct.Name)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectName)
                    .WithMessage("Product name should not be empty");
            RuleFor(p => p.NewProduct.Price)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectPrice)
                    .WithMessage("Price should not be empty")
                .GreaterThan(0)
                    .WithCode(CreateProduct.ErrorCodes.IncorrectPrice)
                    .WithMessage("Price should be a positive number");
            RuleFor(p => p.NewProduct.Description)
                .NotEmpty()
                    .WithCode(CreateProduct.ErrorCodes.IncorrectDescription)
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
                new Product(command.NewProduct.Name, command.NewProduct.Description, command.NewProduct.Price)
                {
                    ModelId = command.NewProduct.ModelId,
                    CategoryId = Id<Category>.From(command.NewProduct.CategoryId),
                    PreviewPhotoId = command.NewProduct.PreviewPhotoId,
                });
            if (result != null)
            {
                foreach (var photo in command.NewProduct.PhotosIds)
                    await dbContext.Photos.AddAsync(
                        new Photo(Id<Photo>.From(photo), Id<Product>.From(result.Entity.Id))
                );
            }
            await dbContext.SaveChangesAsync();
        }
    }
}
