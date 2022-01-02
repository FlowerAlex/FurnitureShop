using System;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.DomainModels.DataAccess;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Users
{
    public class UpdateProfileCH : ICommandHandler<UpdateProfile>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<UpdateProfileCH>();
        private readonly UserManager<AuthUser> userManager;

        private readonly IRepository<User> users;

        public UpdateProfileCH(UserManager<AuthUser> userManager, IRepository<User> users)
        {
            this.userManager = userManager;
            this.users = users;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateProfile command)
        {
            var user = await users.FindAndEnsureExistsAsync(context.UserId);
            var authUser = await userManager.FindByIdAsync(context.UserId.ToString());

            user.updateUser(
                command.Firstname,
                command.Surname,
                command.Username
            );
            if (command.Username != null)
            {
                authUser.UserName = command.Username;
                authUser.NormalizedUserName = command.Username.ToUpper();
            }

            await users.UpdateAsync(user);
            await userManager.UpdateAsync(authUser);
        }
    }
}
