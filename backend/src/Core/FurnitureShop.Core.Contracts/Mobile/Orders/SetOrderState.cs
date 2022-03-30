using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class SetOrderState : IRemoteCommand
    {
        public Guid Id { get; set; }
        public string OrderState { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectStatus = 1;
        }
    }
}
