using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class ShoppingCartByUserId : IRemoteQuery<ShoppingCartDTO>
    {
        public Guid UserId { get; set; }
        public static class ErrorCodes
        {
            public const int UserNotFound = 1;
        }
    }
}
