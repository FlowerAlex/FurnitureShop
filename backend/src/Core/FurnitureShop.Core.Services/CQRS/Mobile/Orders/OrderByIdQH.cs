using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class OrderByIdQH : IQueryHandler<OrderById, OrderDTO?>
    {
        private readonly CoreDbContext dbContext;

        public OrderByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<OrderDTO?> ExecuteAsync(CoreContext context, OrderById query)
        {
            return await dbContext.Orders.Include(o => o.OrdersProducts)
                .Where(p => p.Id == query.OrderId)
                .Select(p => new OrderDTO
                {
                    Id = p.Id,
                    Price = p.Price,
                    UserId = p.UserId,
                    State = p.OrderState.ToString(),
                    OrderedDate = p.OrderedDate,
                    DeliveredDate = p.DeliveredDate,
                })
                .FirstOrDefaultAsync();
        }
    }
}
