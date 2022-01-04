using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    public class GetAllReviews : PaginatedQuery<ReviewDTO> 
    {
        public Guid ProductId { get; set; }
    }
}
