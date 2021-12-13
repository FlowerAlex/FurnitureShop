using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Categories
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class UpdateCategory : IRemoteCommand
    {
        public Guid Id { get; set; }
        public string NewName { get; set; }
        public static class ErrorCodes
        {
            public const int EmptyArgs = 1;
        }
    }
}
