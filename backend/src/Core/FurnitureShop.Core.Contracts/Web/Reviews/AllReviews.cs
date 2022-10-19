using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;
using System;

namespace FurnitureShop.Core.Contracts.Web.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllReviews : PaginatedQuery<ReviewDTO>
    {
        public Guid ProductId { get; set; }
    }
}
