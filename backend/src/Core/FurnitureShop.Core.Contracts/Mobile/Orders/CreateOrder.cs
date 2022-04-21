using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class CreateOrder : IRemoteCommand
    {
        public OrderInfoDTO OrderInfo { get; set; }
        public static class ErrorCodes
        {
            public const int NoProducts = 1;
            public const int IncorrectStreet = 2;
            public const int IncorrectCity = 3;
            public const int IncorrectState = 4;
            public const int IncorrectPostalCode = 5;
            public const int IncorrectCountry = 6;
        }
    }
}
