using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Web.Orders
{
    public class SetOrderStateCV : ContextualValidator<SetOrderState>
    {
        public SetOrderStateCV()
        {
            RuleFor(p => p.OrderState)
                .NotEmpty()
                    .WithCode(SetOrderState.ErrorCodes.IncorrectState)
                    .WithMessage("OrderState should not be empty");
        }
    }

    public class SetOrderStateCH : ICommandHandler<SetOrderState>
    {
        private readonly CoreDbContext dbContext;
        public SetOrderStateCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, SetOrderState command)
        {
            var order = dbContext.Orders.Where(o => o.Id == command.Id).FirstOrDefault();
            if (order == null)
            {
                return;
            }
            
            order.OrderState = Enum.Parse<FurnitureShop.Core.Domain.OrderState>(command.OrderState.ToString(), ignoreCase: true);
            await dbContext.SaveChangesAsync();
        }
    }
}
