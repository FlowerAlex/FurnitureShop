using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;
using System;

namespace FurnitureShop.Core.Contracts.Web.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllReviewsForUser : PaginatedQuery<ReviewDTO>
    {
        public Guid UserId { get; set; }
    }
}
