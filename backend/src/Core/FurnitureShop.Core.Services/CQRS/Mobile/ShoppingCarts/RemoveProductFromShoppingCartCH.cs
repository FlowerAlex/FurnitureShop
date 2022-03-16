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
            var shp = await dbContext.ShoppingCartProducts.Where(
                s => s.ShoppingCartId == cmd.ShoppingCartId && s.ProductId == cmd.ProductId)
                .FirstOrDefaultAsync();
            if (shp == null) { return; }
            dbContext.ShoppingCartProducts.Remove(shp);
            await dbContext.SaveChangesAsync();
        }
    }
}
