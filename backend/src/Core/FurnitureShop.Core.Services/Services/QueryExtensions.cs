using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.Services
{
    public static class QueryExtensions
    {
        public static async Task<List<Guid>> GetProductsInShoppingCart(
            this CoreContext coreContext,
            CoreDbContext dbContext
        )
        {
            var shpId = dbContext.ShoppingCarts
                .Where(s => s.UserId == coreContext.UserId)
                .FirstOrDefault();
            if (shpId == null)
            {
                return new List<Guid>();
            }
            return await dbContext.ShoppingCartProduct
                .Where(p => p.ShoppingCartId == shpId.Id)
                .Select(p => p.ProductId.Value)
                .ToListAsync();
        }

        public static async Task<List<Guid>> GetProductsInFavourties(
            this CoreContext coreContext,
            CoreDbContext dbContext
        )
        {
            return await dbContext.Favourites
                .Where(f => f.UserId == coreContext.UserId)
                .Select(f => f.ProductId.Value)
                .ToListAsync();
        }

        public static double GetOrderPrice(this CreateOrderDTO dto, CoreDbContext dbContext)
        {
            double sum = 0.0;
            foreach (var prod in dto.Products)
            {
                var prodInDb = dbContext.Products.Where(p => p.Id == prod.Id).FirstOrDefault();
                if (prodInDb == null)
                {
                    continue;
                }
                sum += prodInDb.Price;
            }

            return sum;
        }
    }
}
