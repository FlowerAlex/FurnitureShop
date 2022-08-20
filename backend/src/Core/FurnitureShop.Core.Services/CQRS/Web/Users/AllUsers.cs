using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Web.Users;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Users
{
    public class AllUsersCV : ContextualValidator<AllUsers>
    {
    }

    public class AllUsersQH : IQueryHandler<AllUsers, PaginatedResult<UserInfoDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllUsersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<UserInfoDTO>> ExecuteAsync(CoreContext context, AllUsers query)
        {
            return await dbContext.Users.Select(user => new UserInfoDTO
            {
                Firstname = user.Firstname,
                Surname = user.Surname,
                EmailAddress = user.EmailAddress,
                Username = user.Username,
                isBanned = IsUserBanned(dbContext,user.Id),
            })
            .ToPaginatedResultAsync(query);
        }
        private bool IsUserBanned(CoreDbContext dbContext, Guid userId)
        {
            var claim = dbContext.UserClaims.Where(uc => uc.UserId == userId).FirstOrDefault();
            if(claim == null)
            {
                return false;
            }
            else
            return claim.ClaimValue == Auth.Roles.BannedUser;
        }
    }
}
