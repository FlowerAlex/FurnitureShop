using System;
using System.Threading.Tasks;
using AutoMapper;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class SetOrderStateQH : ICommandHandler<SetOrderState>
    {
        private readonly CoreDbContext dbContext;
        private IMapper mapper;
        public SetOrderStateQH(CoreDbContext dbContext, IMapper mapper)
        {
            this.dbContext = dbContext;
            this.mapper = mapper;
        }

        public async Task ExecuteAsync(CoreContext context, SetOrderState command)
        {
            var order = await dbContext.Orders.FindAsync(command.Id);
            if (order == null)
            {
                return;
            }
            order.OrderState = Enum.Parse<OrderState>(command.OrderState);
            await dbContext.SaveChangesAsync();
        }
    }
}
