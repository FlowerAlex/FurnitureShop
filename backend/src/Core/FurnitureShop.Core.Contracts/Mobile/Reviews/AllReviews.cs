using System;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Shared;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class AllReviews : PaginatedQuery<ReviewDTO>
    {
        public Guid ProductId { get; set; }
    }
}
