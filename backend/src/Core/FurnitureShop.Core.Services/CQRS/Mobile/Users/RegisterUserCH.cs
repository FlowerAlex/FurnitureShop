using System;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.CQRS.Execution;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Users
{
    public class RegisterUserCH : ICommandHandler<CoreContext, RegisterUser>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<RegisterUserCH>();

        private readonly UserManager<AuthUser> userManager;
        private readonly CoreDbContext dbContext;

        public RegisterUserCH(UserManager<AuthUser> userManager, CoreDbContext dbContext)
        {
            this.userManager = userManager;
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, RegisterUser command)
        {
            var random = new Random();

            var user = new User(
                command.UserInfo.Firstname,
                command.UserInfo.Surname,
                command.UserInfo.Username,
                command.UserInfo.EmailAddress);

            var authUser = new AuthUser
            {
                Id = user.Id,
                UserName = user.Username,
                Email = user.EmailAddress,
                Claims =
                {
                    new IdentityUserClaim<Guid>()
                    {
                        ClaimType = Auth.KnownClaims.Role,
                        ClaimValue = Auth.Roles.User,
                    },
                },
            };

            dbContext.Users.Add(user);
            var result = await userManager.CreateAsync(authUser, command.Password);

            if (result.Succeeded)
            {
                logger.Information("Added new user with id {UserId}", user.Id);
            }
            else
            {
                logger.Error("Cannot create Identity user, error: {@Errors}", result.Errors);
                throw new InvalidOperationException("Cannot create Identity user.");
            }
            
            await dbContext.SaveChangesAsync();
            dbContext.ShoppingCarts.Add(new Domain.ShoppingCart
            {
                UserId = user.Id,
            });
        }
    }
}
