using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class AddToFavouritesCH : ICommandHandler<AddToFavourites>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<AddToFavourites>();
        private readonly CoreDbContext dbContext;
        public AddToFavouritesCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, AddToFavourites command)
        {
            var favourites = dbContext.Favourites.Where(f => f.UserId == context.UserId && f.ProductId == command.ProductId);
            if (favourites != null && favourites.Any())
            {
                return;
            }
            dbContext.Favourites.Add(
                new UserProduct()
                {
                    UserId = context.UserId,
                    ProductId = Id<Product>.From(command.ProductId),
                }
            );
            await dbContext.SaveChangesAsync();
        }
    }
}
