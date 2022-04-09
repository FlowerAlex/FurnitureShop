using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class CreateOrderQH : ICommandHandler<CreateOrder>
    {
        private readonly CoreDbContext dbContext;
        public CreateOrderQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateOrder command)
        {
            var result = await dbContext.Orders.AddAsync(// mapper.Map<Order>(command.NewOrder));
                new Order(command.OrderInfo.Street, command.OrderInfo.City, command.OrderInfo.State,
                    command.OrderInfo.PostalCode, command.OrderInfo.Country)
                {
                    UserId = Id<User>.From(context.UserId),
                    Price = command.OrderInfo.Price,
                    OrderedDate = DateTime.Now,
                    OrderState = OrderState.Pending,
                    OrdersProducts = command.OrderInfo.OrderProducts.Select(op => new OrderProduct
                    {
                        ProductId = Id<Product>.From(op.Product.Id),
                        Amount = op.Amount,
                    }).ToList(),
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
