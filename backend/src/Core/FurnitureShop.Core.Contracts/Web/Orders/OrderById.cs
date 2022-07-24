using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class OrderById : IRemoteQuery<OrderDTO?>
    {
        public Guid Id { get; set; }
    }
}
