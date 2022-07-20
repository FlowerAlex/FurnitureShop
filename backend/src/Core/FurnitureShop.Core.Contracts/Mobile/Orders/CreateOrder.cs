using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class CreateOrder : IRemoteCommand
    {
        public OrderDTOBase NewOrder { get; set; }
        public static class ErrorCodes
        {
            public const int NoProducts = 1;
            public const int IncorrectAddress = 2;
            public const int NotEnoughFunds = 3;
        }
    }
}
