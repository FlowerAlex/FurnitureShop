using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UserInfo : IRemoteQuery<UserInfoDTO>
    {
        public static class ErrorCodes
        {
            public const int UserNotFound = 1;
        }
    }
}