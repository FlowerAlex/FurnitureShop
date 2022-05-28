using System;
using LeanCode.CQRS.Security;
using LeanCode.CQRS;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class ChangeProductAmount : IRemoteCommand
    {
        public Guid ProductId { get; set; }
        public int NewAmount { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectAmount = 1;
        }
    }
}
