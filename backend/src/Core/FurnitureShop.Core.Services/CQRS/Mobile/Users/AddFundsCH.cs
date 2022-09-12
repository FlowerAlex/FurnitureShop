using System;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.DomainModels.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Users
{
    public class AddFundsCV : ContextualValidator<AddFunds>
    {
        public AddFundsCV()
        {
            RuleFor(a => a.FundsToAdd)
                .GreaterThan(0)
                .WithMessage("Funds to add should be a number greater than 0")
                .WithCode(AddFunds.ErrorCodes.IncorrectAmount);
        }
    }

    public class AddFundsCH : ICommandHandler<AddFunds>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<AddFundsCH>();
        private readonly IRepository<User> users;

        public AddFundsCH(UserManager<AuthUser> userManager, IRepository<User> users)
        {
            this.users = users;
        }

        public async Task ExecuteAsync(CoreContext context, AddFunds command)
        {
            var user = await users.FindAndEnsureExistsAsync(context.UserId);

            user.Funds += command.FundsToAdd;

            await users.UpdateAsync(user);
        }
    }
}
