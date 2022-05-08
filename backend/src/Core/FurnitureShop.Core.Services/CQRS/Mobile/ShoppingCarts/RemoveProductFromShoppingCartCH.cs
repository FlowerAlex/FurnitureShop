using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.ShoppingCart;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using LeanCode.DomainModels.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart
{
    public class RemoveProductFromShoppingCartCH : ICommandHandler<RemoveProductFromShoppingCart>
    {
        private readonly CoreDbContext dbContext;

        public RemoveProductFromShoppingCartCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, RemoveProductFromShoppingCart cmd)
        {
            var shoppingCart = await dbContext.ShoppingCarts.Where(s => s.UserId == context.UserId).FirstOrDefaultAsync();
            if (shoppingCart == null)
            {
                return ;
            }
            var shp = await dbContext.ShoppingCartProduct.Where(
                s => s.ShoppingCartId == shoppingCart.Id && s.ProductId == cmd.ProductId)
                .FirstOrDefaultAsync();
            if (shp == null) { return; }
            dbContext.ShoppingCartProduct.Remove(shp);

            await dbContext.SaveChangesAsync();
        }
    }
}
