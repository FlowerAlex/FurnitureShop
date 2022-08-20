using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Mobile.Users;

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