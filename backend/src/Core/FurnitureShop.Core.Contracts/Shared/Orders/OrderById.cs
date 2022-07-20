using System;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Shared.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class OrderById : IRemoteQuery<OrderDTO?>
    {
        public Guid Id { get; set; }
    }
}
