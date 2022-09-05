using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class CreateOrderCV : ContextualValidator<CreateOrder>
    {
        public CreateOrderCV()
        {
            RuleFor(p => p.NewOrder.Products)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.NoProducts)
                    .WithMessage("No products to order");
            RuleFor(p => p.NewOrder.Address)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("Street should not be empty");
            RuleForAsync(p => p.NewOrder.Price, DoesUserHaveEnoughMoney)
               .Equal(false)
                   .WithMessage("Not enough funds to pay for the order.")
                   .WithCode(CreateOrder.ErrorCodes.NotEnoughFunds);
        }
        private static async Task<bool> DoesUserHaveEnoughMoney(IValidationContext ctx, double price)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            var dbContext = ctx.GetService<CoreDbContext>();
            var user = await dbContext.Users
                .Where(u => u.Id == uid).FirstOrDefaultAsync();
            if (user == null)
            {
                return false;
            }

            return user.Funds >= (int)price;
        }
    }
    public class CreateOrderQH : ICommandHandler<CreateOrder>
    {
        private readonly CoreDbContext dbContext;
        public CreateOrderQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateOrder command)
        {
            var result = await dbContext.Orders.AddAsync(
                new Order(command.NewOrder.Address)
                {
                    UserId = context.UserId,
                    Price = command.NewOrder.Price,
                    OrderedDate = DateTime.Now,
                    OrderState = OrderState.Pending,
                });
            if (result.Entity != null)
            {
                foreach (var ordProd in command.NewOrder.Products)
                {
                    await dbContext.OrderProduct.AddAsync((
                        new OrderProduct
                        {
                            ProductId = Id<Product>.From(ordProd.Id),
                            Amount = ordProd.Amount,
                            OrderId = result.Entity.Id
                        }));
                }
            }
            await dbContext.SaveChangesAsync();

        }
    }
}
