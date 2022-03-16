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
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart
{
    public class GetShoppingCartCV : ContextualValidator<GetShoppingCart>
    {
        public GetShoppingCartCV()
        {
            RuleForAsync(p => p, DoesUserExistAsync)
                .Equal(false)
                    .WithMessage("User not found.")
                    .WithCode(GetShoppingCart.ErrorCodes.UserNotFound);
        }

        private static async Task<bool> DoesUserExistAsync(IValidationContext ctx, GetShoppingCart cmd)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            var dbContext = ctx.GetService<CoreDbContext>();
            var count = await dbContext.Users
                .Where(u => u.Id == uid).CountAsync();
            return count != 0;
        }
    }
    
    public class GetShoppingCartQH : IQueryHandler<GetShoppingCart, ShoppingCartDTO?>
    {
        private readonly CoreDbContext dbContext;

        public GetShoppingCartQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ShoppingCartDTO?> ExecuteAsync(CoreContext context, GetShoppingCart query)
        {
            return await dbContext.ShoppingCarts.Include(p => p.ShoppingCartProducts)
                .Where(p => p.Id == query.ShoppingCartId)
                .Select(p => new ShoppingCartDTO
                {
                    ShoppingCartInfo = new ShoppingCartInfoDTO
                    {
                        Price = 0, // todo douczyc sie linqa
                        ShoppingCartProducts = p.ShoppingCartProducts.Select(sp => new ShoppingCartProductDTO
                        {
                            ProductId = sp.ProductId,
                            Amount = sp.Amount,
                        }),
                        UserId = p.UserId,
                    },
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
