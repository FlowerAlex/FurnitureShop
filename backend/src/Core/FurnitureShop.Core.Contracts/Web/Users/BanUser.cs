using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class BanUser : IRemoteCommand
    {
        public Guid UserId {get;set;}
        public static class ErrorCodes
        {
            public const int UserNotFound = 1;
        }

    }
}