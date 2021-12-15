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
            var result = await dbContext.Orders.AddAsync(mapper.Map<Order>(command.NewOrder));
                // new Order(command.NewOrder.Street, command.NewOrder.City, command.NewOrder.State,
                //     command.NewOrder.PostalCode, command.NewOrder.Country)
                // {
                //     UserId = Id<User>.From(command.NewOrder.UserId),
                //     Price = command.NewOrder.Price,
                //     OrderedDate = DateTime.Now,
                //     OrdrerState = OrderState.Pending,
                //     Products = new List<Product>(), // command.NewOrder.Products.Select( p => new Pro) TODO
                // });
        }
    }
}
