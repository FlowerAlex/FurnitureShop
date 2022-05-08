using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    public class ReviewById : IRemoteQuery<ReviewDTO?>
    {
        public Guid Id { get; set; }
    }
}
