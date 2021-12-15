using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class CreateProductQH : ICommandHandler<CreateProduct>
    {
        private readonly CoreDbContext dbContext;
        public CreateProductQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateProduct command)
        {
            var result = await dbContext.Products.AddAsync(
                new Product(command.OrderInfoDTO.Name, command.OrderInfoDTO.Description, command.OrderInfoDTO.Price)
                {
                    ModelUrl = command.OrderInfoDTO.ModelUrl,
                    CategoryId = Id<Category>.From(command.OrderInfoDTO.CategoryId),
                });
        }
    }
}
