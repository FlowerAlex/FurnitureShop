using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class DeleteReview : IRemoteCommand
    {
        public Guid Id { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectName = 1;
            public const int IncorrectDescription = 2;
            public const int IncorrectPrice = 3;
        }
    }
}
