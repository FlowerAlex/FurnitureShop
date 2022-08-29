using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllUsers : PaginatedQuery<UserInfoDTO>
    {
        public static class ErrorCodes
        {
            public const int UserNotFound = 1;
        }
    }
}
