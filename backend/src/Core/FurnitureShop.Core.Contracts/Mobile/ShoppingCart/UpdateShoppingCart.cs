using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UpdateShoppingCart : IRemoteCommand
    {
        public Guid ShoppingCartId { get; set; }
        public ShoppingCartInfoDTO ShoppingCartInfo { get; set; }
        public static class ErrorCodes
        {
            public const int ShoppingCartNotFound = 1;
            public const int NoProducts = 2;
        }
    }
}
