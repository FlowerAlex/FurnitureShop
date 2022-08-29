using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllOrders : SortableMulitiFilterPaginatedQuery<OrderDTO, OrdersSortFieldDTO?, OrdersFilterFieldDTO>
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
        Address = 1,
        UserId = 2,
    }
}
