using System;
using LeanCode.CQRS.Security;
using LeanCode.CQRS;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class RemoveProductFromShoppingCart : IRemoteCommand
    {
        public Guid ShoppingCartId { get; set; }
        public Guid ProductId { get; set; }
        public static class ErrorCodes
        {
            public const int ShoppingCartNotFound = 1;
        }
    }
}
