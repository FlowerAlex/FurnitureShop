using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Users;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Users
{
    public class UserInfoCV : ContextualValidator<UserInfo>
    {
        public UserInfoCV()
        {
            RuleForAsync(userInfo => userInfo, DoesUserExistAsync)
                .Equal(false)
                .WithMessage("User not found.")
                .WithCode(UserInfo.ErrorCodes.UserNotFound);
        }

        private static async Task<bool> DoesUserExistAsync(IValidationContext ctx, UserInfo cmd)
        {
            var uid = ctx.AppContext<CoreContext>().UserId;
            var dbContext = ctx.GetService<CoreDbContext>();
            var count = await dbContext.Users.Where(u => u.Id == uid).CountAsync();
            return count != 0;
        }
    }

    public class UserInfoQH : IQueryHandler<UserInfo, UserInfoDTO>
    {
        private readonly CoreDbContext dbContext;

        public UserInfoQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<UserInfoDTO> ExecuteAsync(CoreContext context, UserInfo query)
        {
            return await dbContext.Users
                .Where(user => user.Id == context.UserId)
                .Select(
                    user =>
                        new UserInfoDTO
                        {
                            Firstname = user.Firstname,
                            Surname = user.Surname,
                            EmailAddress = user.EmailAddress,
                            Username = user.Username,
                            Address = user.Address,
                        }
                )
                .FirstAsync();
        }
    }
}
