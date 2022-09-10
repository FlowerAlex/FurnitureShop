using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.Services
{
    public static class QueryExtensions
    {
        public static async Task<List<Guid>> GetProductsInShoppingCart(this CoreContext coreContext, CoreDbContext dbContext)
        {
            var shpId = dbContext.ShoppingCarts.Where(s => s.UserId == coreContext.UserId).FirstOrDefault();
            if (shpId == null)
            {
                return new List<Guid>();
            }
            return await dbContext.ShoppingCartProduct.Where(p => p.ShoppingCartId == shpId.Id).Select(p => p.ProductId.Value).ToListAsync();
        }
        public static async Task<List<Guid>> GetProductsInFavourties(this CoreContext coreContext, CoreDbContext dbContext)
        {
            return await dbContext.Favourites
                .Where(f => f.UserId == coreContext.UserId)
                .Select(f => f.ProductId.Value).ToListAsync();
        }
        public static double GetShoppingCartPrice(this CoreContext coreContext, CoreDbContext dbContext)
        {
            var shpId = dbContext.ShoppingCarts.Where(s => s.UserId == coreContext.UserId).FirstOrDefault();
            if (shpId == null)
            {
                return 0.0;
            }
            return dbContext.ShoppingCartProduct.Where(p => p.ShoppingCartId == shpId.Id).ToList().Join(
                dbContext.Products.ToList(),
                s => s.ProductId,
                p => p.Id,
                (s,p) => new {
                    amount = s.Amount,
                    price = p.Price,
                }
            ).Sum(p => p.amount * p.price);
        }
    }
}
