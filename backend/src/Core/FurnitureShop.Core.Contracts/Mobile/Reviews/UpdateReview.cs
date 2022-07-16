using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UpdateReview : IRemoteCommand
    {
        public Guid Id { get; set; }
        public ReviewInfoDTO ReviewInfo { get; set; }
        public static class ErrorCodes
        {
            public const int EmptyReviewText = 1;
            public const int IncorrectRating = 2;
        }
    }
}
