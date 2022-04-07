using System;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class SetOrderStateCH : ICommandHandler<SetOrderState>
    {
        private readonly CoreDbContext dbContext;
        public SetOrderStateCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
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
