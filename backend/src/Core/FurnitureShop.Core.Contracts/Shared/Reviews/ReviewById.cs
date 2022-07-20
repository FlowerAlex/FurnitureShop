using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Mobile.Reviews;

namespace FurnitureShop.Core.Contracts.Shared.Reviews
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class ReviewById : IRemoteQuery<ReviewDTO?>
    {
        public Guid Id { get; set; }
    }
}
