using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Dtos;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class GetAllOrders : SortableMulitiFilterPaginatedQuery<OrderDTO, OrdersSortFieldDTO?, OrdersFilterFieldDTO>
    {
        public static class ErrorCodes
        {
            public const int IncorrectStatus = 1;
        }
    }
    public enum OrdersSortFieldDTO
    {
        OrderedDate = 0,
        DeliveredDate = 1,
    }
    public enum OrdersFilterFieldDTO
    {
        OrderState = 0,
        Country = 1,
        State = 2,
        City = 3,
        Street = 4,
        PostalCode = 5,
        UserId = 6,
    }
}
