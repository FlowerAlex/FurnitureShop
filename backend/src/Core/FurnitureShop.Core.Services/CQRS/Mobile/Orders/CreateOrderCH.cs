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
                new Order(command.OrderInfoDTO.Street, command.OrderInfoDTO.City, command.OrderInfoDTO.State,
                    command.OrderInfoDTO.PostalCode, command.OrderInfoDTO.Country)
                {
                    UserId = Id<User>.From(command.OrderInfoDTO.UserId),
                    Price = command.OrderInfoDTO.Price,
                    OrderedDate = DateTime.Now,
                    OrderState = OrderState.Pending,
                    OrdersProducts = command.OrderInfoDTO.OrderProducts.Select(op => new OrderProduct
                    {
                        ProductId = Id<Product>.From(op.ProductId),
                        Amount = op.Amount,
                    }).ToList()
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
