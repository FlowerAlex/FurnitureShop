using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class AddFunds : IRemoteCommand
    {
        public int FundsToAdd { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectAmount = 1;
        }
    }
}
