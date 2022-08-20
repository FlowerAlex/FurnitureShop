using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class SetOrderState : IRemoteCommand
    {
        public Guid Id { get; set; }
        public OrderState OrderState { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectState = 1;
        }
    }
    public enum OrderState
    {
        Pending,
        Cancelled,
        InProgress,
        Finished,
    }
}
