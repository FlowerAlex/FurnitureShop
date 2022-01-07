using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AutoMapper;
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
        private IMapper mapper;
        public CreateOrderQH(CoreDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task ExecuteAsync(CoreContext context, CreateOrder command)
        {
            var result = await dbContext.Orders.AddAsync(// mapper.Map<Order>(command.NewOrder));
                new Order(command.OrderInfo.Street, command.OrderInfo.City, command.OrderInfo.State,
                    command.OrderInfo.PostalCode, command.OrderInfo.Country)
                {
                    UserId = Id<User>.From(command.OrderInfo.UserId),
                    Price = command.OrderInfo.Price,
                    OrderedDate = DateTime.Now,
                    OrderState = OrderState.Pending,
                    OrdersProducts = command.OrderInfo.OrderProducts.Select(op => new OrderProduct
                    {
                        ProductId = Id<Product>.From(op.ProductId),
                        Amount = op.Amount,
                    }).ToList(),
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
