using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.ShoppingCart;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using LeanCode.DomainModels.DataAccess;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart
{
    public class AddProductsToShoppingCartCH : ICommandHandler<AddProductsToShoppingCart>
    {
        private readonly CoreDbContext dbContext;

        public AddProductsToShoppingCartCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, AddProductsToShoppingCart cmd)
        {
            var shc = await dbContext.ShoppingCarts.Include(sp => sp.ShoppingCartProducts)
                .Where(sp => sp.UserId == context.UserId).FirstOrDefaultAsync();
            var shp = new ShoppingCartProduct
            {
                Amount = cmd.Amount,
                ProductId = Id<Product>.From(cmd.ProductId),
            };
            if (shc == null)
            {
                return;
            }

            shc.ShoppingCartProducts.Add(shp);
            dbContext.ShoppingCarts.Update(shc);
            await dbContext.SaveChangesAsync();
        }
    }
}
