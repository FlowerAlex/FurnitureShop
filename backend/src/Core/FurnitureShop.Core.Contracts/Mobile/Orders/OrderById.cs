using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class OrderById : IRemoteQuery<OrderDTO?>
    {
        public Guid Id { get; set; }
    }
}
