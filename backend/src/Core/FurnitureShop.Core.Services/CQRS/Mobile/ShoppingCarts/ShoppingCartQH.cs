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
    public class ShoppingCartCV : ContextualValidator<Contracts.Mobile.ShoppingCart.ShoppingCart>
    {
        public ShoppingCartCV()
        {
            RuleForAsync(p => p, DoesUserExistAsync)
                .Equal(false)
                    .WithMessage("User not found.")
                    .WithCode(FurnitureShop.Core.Contracts.Mobile.ShoppingCart.ShoppingCart.ErrorCodes.UserNotFound);
        }

        private static async Task<bool> DoesUserExistAsync(IValidationContext ctx, Contracts.Mobile.ShoppingCart.ShoppingCart cmd)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            var dbContext = ctx.GetService<CoreDbContext>();
            var count = await dbContext.Users
                .Where(u => u.Id == uid).CountAsync();
            return count != 0;
        }
    }

    public class ShoppingCartQH : IQueryHandler<Contracts.Mobile.ShoppingCart.ShoppingCart, ShoppingCartDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ShoppingCartQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ShoppingCartDTO?> ExecuteAsync(CoreContext context, Contracts.Mobile.ShoppingCart.ShoppingCart query)
        {
            var ret = await dbContext.ShoppingCarts
                .Where(p => p.UserId == context.UserId)
                .Select(p => new ShoppingCartDTO
                {
                    ShoppingCartInfo = new ShoppingCartInfoDTO
                    {
                        ShoppingCartProducts = dbContext.Products
                        .Join(

                            dbContext.ShoppingCartProduct,

                            prod => prod.Id,
                            shp => shp.ProductId,
                            (prod, shp) => new ShoppingCartProductDTO
                            {
                                Amount = shp.Amount,
                                ShoppingCartId = shp.ShoppingCartId.Value,
                                Product = new Contracts.Mobile.Products.ProductDTO
                                {
                                    Id = prod.Id,
                                    ProductInfo = new Contracts.Mobile.Products.ProductInfoDTO
                                    {
                                        Name = prod.Name,
                                        Price = prod.Price,
                                        PreviewPhotoURL = prod.PreviewPhotoUrl,
                                        CategoryId = prod.CategoryId,
                                    }
                                }
                            }
                        ).Where(shp => shp.ShoppingCartId == p.Id).ToList(),
                        UserId = p.UserId,
                    },
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
            if (ret == null) { return null; }
            ret.ShoppingCartInfo.Price = ret.ShoppingCartInfo.ShoppingCartProducts.Sum(shp => shp.Product.ProductInfo.Price * shp.Amount);
            return ret;
        }
    }
}
