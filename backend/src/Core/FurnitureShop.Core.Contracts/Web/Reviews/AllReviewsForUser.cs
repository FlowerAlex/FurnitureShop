using System;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Mobile.Reviews;

namespace FurnitureShop.Core.Contracts.Web.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllReviewsForUser : PaginatedQuery<ReviewDTO>
    {
        public Guid UserId { get; set; }
    }
}
