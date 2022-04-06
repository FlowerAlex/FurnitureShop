using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class GetShoppingCart : IRemoteQuery<ShoppingCartDTO>
    {
        public Guid ShoppingCartId { get;set; }
        public static class ErrorCodes
        {
            public const int UserNotFound = 1;
        }
    }
}
