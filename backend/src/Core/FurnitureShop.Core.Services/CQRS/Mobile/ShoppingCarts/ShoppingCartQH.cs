using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Mobile.ShoppingCart;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart
{
    public class ShoppingCartQH : IQueryHandler<Contracts.Mobile.ShoppingCart.ShoppingCart, ShoppingCartDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ShoppingCartQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ShoppingCartDTO?> ExecuteAsync(CoreContext context, Contracts.Mobile.ShoppingCart.ShoppingCart query)
        {
            var productsInFavourites = await context.GetProductsInFavourties(dbContext);
            var products = dbContext.Products.ToList();
            var shoppingCart = await dbContext.ShoppingCarts
                .Where(p => p.UserId == context.UserId)
                .FirstOrDefaultAsync();
            if (shoppingCart == null) { return null; }
            var shopingCartProducts = dbContext.ShoppingCartProduct.Where(s => s.ShoppingCartId == shoppingCart.Id).ToList();
            var ret = new ShoppingCartDTO();
            ret.ShoppingCartProducts = shopingCartProducts
                .Join(
                    products,
                    shp => shp.ProductId,
                    prod => prod.Id,
                    (shp, prod) => new ShoppingCartProductDTO
                    {
                        Amount = shp.Amount,
                        Product = new ProductDTO
                        {
                        Id = prod.Id,
                        Name = prod.Name,
                        Price = prod.Price,
                        PreviewPhotoId = prod.PreviewPhotoId,
                        CategoryId = prod.CategoryId,
                        InShoppingCart = true,
                        InFavourites = productsInFavourites.Contains(prod.Id),
                        },
                    }
                ).ToList();
            ret.Price = ret.ShoppingCartProducts.Sum(shp => shp.Product.Price * shp.Amount);
            return ret;
        }
    }
}
