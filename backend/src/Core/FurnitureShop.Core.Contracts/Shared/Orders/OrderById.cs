using System;
using FurnitureShop.Core.Contracts.Dtos;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Shared.Orders
{
    [AllowUnauthorized]
    public class OrderById : IRemoteQuery<OrderDTO?>
    {
        public Guid Id { get; set; }
    }
}
