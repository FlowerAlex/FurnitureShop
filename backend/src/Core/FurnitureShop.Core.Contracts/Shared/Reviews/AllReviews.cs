using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Mobile.Reviews;

namespace FurnitureShop.Core.Contracts.Shared.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class AllReviews : PaginatedQuery<ReviewDTO>
    {
        public Guid ProductId { get; set; }
    }
}
