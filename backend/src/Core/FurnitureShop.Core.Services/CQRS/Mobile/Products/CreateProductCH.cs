using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class GetProductQH : ICommandHandler<CreateProduct>
    {
        private readonly CoreDbContext dbContext;
        public GetProductQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateProduct command)
        {
            var result = await dbContext.Products.AddAsync(
                new Product(
                    command.NewProduct.Name,
                    command.NewProduct.Description,
                    command.NewProduct.Description,
                    null));
            // tutja jeszcze jesli result jets fail zrobic
        }
    }
}
