using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
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
                    AvergeRating = 0,
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
