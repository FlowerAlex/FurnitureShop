using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class AllReviews : IRemoteQuery<AllReviewsDTO>
    {
        public Guid ProductId { get; set; }
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
    }
}
