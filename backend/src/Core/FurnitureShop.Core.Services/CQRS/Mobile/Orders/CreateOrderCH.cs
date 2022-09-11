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
            RuleFor(p => p.NewOrder.Address, IsShoppingCartEmpty)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.NoProducts)
                    .WithMessage("No products selected for order");
            RuleFor(p => p.NewOrder.Address, IsAddressSet)
                .NotEmpty()
                    .WithCode(CreateOrder.ErrorCodes.IncorrectAddress)
                    .WithMessage("User and order have no addres set");
            RuleForAsync(p => p.NewOrder, DoesUserHaveEnoughMoney)
               .Equal(false)
                   .WithMessage("Not enough funds to pay for the order.")
                   .WithCode(CreateOrder.ErrorCodes.NotEnoughFunds);
        }
        private static bool IsShoppingCartEmpty(IValidationContext ctx, string? address)
        {
            var dbContext = ctx.GetService<CoreDbContext>();
            return ctx.AppContext<CoreContext>().GetProductsInShoppingCart(dbContext).GetAwaiter().GetResult().Any();
        }
        private static async Task<bool> DoesUserHaveEnoughMoney(IValidationContext ctx, CreateOrderDTO dto)
        {
            var dbContext = ctx.GetService<CoreDbContext>();
            var user = await GetCurrentUser(ctx, dbContext);
            if (user == null)
            {
                return false;
            }
            return user.Funds >= (int)dto.GetOrderPrice(dbContext);
        }
        private static async Task<bool> IsAddressSet(IValidationContext ctx, string? address)
        {
            var dbContext = ctx.GetService<CoreDbContext>();
            var user = await GetCurrentUser(ctx, dbContext);
            if (user == null)
            {
                return false;
            }
            return !string.IsNullOrWhiteSpace(address) && !string.IsNullOrWhiteSpace(user.Address);
        }
        private static async Task<User?> GetCurrentUser(IValidationContext ctx, CoreDbContext dbContext)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            return await dbContext.Users
                .Where(u => u.Id == uid).FirstOrDefaultAsync();
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
            var address = command.NewOrder.Address ?? dbContext.Users.Where(u => u.Id == context.UserId).First().Address;
            var newOrder = new Order(address)
            {
                UserId = context.UserId,
                Price = command.NewOrder.GetOrderPrice(dbContext),
                OrderedDate = DateTime.Now,
                OrderState = OrderState.Pending,
            };
            var shp = await dbContext.ShoppingCarts.Where(s => s.UserId == context.UserId).FirstOrDefaultAsync();
            foreach (var prod in command.NewOrder.Products)
            {
                newOrder.OrdersProducts.Add(new OrderProduct()
                {
                    Amount = prod.Amount,
                    ProductId = Id<Product>.From(prod.Id),
                    OrderId = newOrder.Id
                });
            }
            var result = await dbContext.Orders.AddAsync(newOrder);
            if (result != null)
            {
                dbContext.ShoppingCarts.Remove(shp!);
            }
            await dbContext.SaveChangesAsync();
        }
    }
}
