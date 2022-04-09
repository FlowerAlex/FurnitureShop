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
            var ret =  await dbContext.ShoppingCarts
                .Where(p => p.Id == query.ShoppingCartId)
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
                        ).Where(shp => shp.ShoppingCartId == query.ShoppingCartId).ToList(),
                        UserId = p.UserId,
                    },
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
                if (ret == null) {return null;}
                ret.ShoppingCartInfo.Price = ret.ShoppingCartInfo.ShoppingCartProducts.Sum(shp => shp.Product.ProductInfo.Price * shp.Amount);
                return ret;
        }
    }
}
