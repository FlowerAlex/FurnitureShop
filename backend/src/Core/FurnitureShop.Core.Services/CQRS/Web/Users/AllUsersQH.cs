using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Web.Users;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Web.Users
{
    public class AllUsersCV : ContextualValidator<AllUsers> { }

    public class AllUsersQH : IQueryHandler<AllUsers, PaginatedResult<UserInfoDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllUsersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<UserInfoDTO>> ExecuteAsync(
            CoreContext context,
            AllUsers query
        )
        {
            return await dbContext.Users
                .Join(
                    dbContext.UserClaims.Where(
                        c =>
                            c.ClaimValue == Auth.Roles.BannedUser || c.ClaimValue == Auth.Roles.User
                    ),
                    u => u.Id,
                    c => c.UserId,
                    (u, c) =>
                        new UserInfoDTO()
                        {
                            Id = u.Id,
                            Firstname = u.Firstname,
                            Surname = u.Surname,
                            EmailAddress = u.EmailAddress,
                            Username = u.Username,
                            IsBanned = c.ClaimValue == Auth.Roles.BannedUser,
                        }
                )
                .ToPaginatedResultAsync(query);
        }
    }
}
