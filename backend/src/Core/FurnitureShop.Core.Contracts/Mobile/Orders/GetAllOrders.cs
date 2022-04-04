using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class GetAllOrders : IRemoteQuery<List<OrderDTO>>
    {
        public string? OrderState { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectStatus = 1;
        }
        public enum OrdersSortFieldDTO
        {
            Date = 0,     
        }
    }
}
