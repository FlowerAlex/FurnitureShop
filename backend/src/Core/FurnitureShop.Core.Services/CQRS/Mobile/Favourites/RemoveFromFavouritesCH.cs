using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Favourites
{
    public class RemoveFromFavouritesCH : ICommandHandler<RemoveFromFavourites>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<RemoveFromFavourites>();
        private readonly CoreDbContext dbContext;
        public RemoveFromFavouritesCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, RemoveFromFavourites command)
        {
            var toDelete = dbContext.Favourites.Where(f => f.UserId == context.UserId && f.ProductId == command.ProductId).FirstOrDefault();
            if (toDelete == null)
            {
                return;
            }
            dbContext.Favourites.Remove(toDelete);
            await dbContext.SaveChangesAsync();
        }
    }
}
