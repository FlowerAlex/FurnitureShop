using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class AddProductsToShoppingCart : IRemoteCommand
    {
        public Guid ProductId { get; set; }
        public int Amount { get; set; }

        public static class ErrorCodes
        {
            public const int IncorrectAmount = 1;
        }
    }
}
