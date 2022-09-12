using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UpdateReview : IRemoteCommand
    {
        public ReviewDTO UpdatedReview { get; set; }

        public static class ErrorCodes
        {
            public const int EmptyReviewText = 1;
            public const int IncorrectRating = 2;
        }
    }
}
