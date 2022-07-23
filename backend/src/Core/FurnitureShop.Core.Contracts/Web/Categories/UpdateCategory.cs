using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class UpdateCategory : IRemoteCommand
    {
        public Guid Id { get; set; }
        public string NewName { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectName = 1;
        }
    }
}
