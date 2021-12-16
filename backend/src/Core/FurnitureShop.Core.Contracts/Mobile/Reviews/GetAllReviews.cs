using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class GetAllReviews : IRemoteQuery<List<ReviewDTO>> // TODO paginated query
    {
        public Guid? ProductId { get; set; }
        public Guid? UserId { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectName = 1;
            public const int IncorrectDescription = 2;
            public const int IncorrectPrice = 3;
        }
    }
}
