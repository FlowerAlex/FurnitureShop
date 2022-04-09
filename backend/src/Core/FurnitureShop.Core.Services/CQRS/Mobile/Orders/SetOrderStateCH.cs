using System;
using System.Linq;
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
            var order = dbContext.Orders.Where( o => o.Id == command.Id).FirstOrDefault();
            if (order == null)
            {
                return;
            }
            order.OrderState = Enum.Parse<OrderState>(command.OrderState,ignoreCase:true);
            await dbContext.SaveChangesAsync();
        }
    }
}
