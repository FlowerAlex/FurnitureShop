using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Web.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.CQRS.Execution;
using Microsoft.AspNetCore.Identity;

namespace FurnitureShop.Core.Services.CQRS.Web.Users
{
    public class UnbanUserCH : ICommandHandler<CoreContext, UnbanUser>
    {
        private readonly Serilog.ILogger logger = Serilog.Log.ForContext<UnbanUserCH>();

        private readonly UserManager<AuthUser> userManager;
        private readonly CoreDbContext dbContext;

        public UnbanUserCH(UserManager<AuthUser> userManager, CoreDbContext dbContext)
        {
            this.userManager = userManager;
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UnbanUser command)
        {
            var user = await userManager.FindByIdAsync(command.UserId.ToString());
            var claims = await userManager.GetClaimsAsync(user);
            await userManager.RemoveClaimsAsync(user, claims.Where(c => c.Value == Auth.Roles.BannedUser));
            await userManager.AddClaimAsync(user, new IdentityUserClaim<Guid>()
            {
                ClaimType = Auth.KnownClaims.Role,
                ClaimValue = Auth.Roles.User,
            }.ToClaim());
        }
    }
}
