using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class DeleteCategory : IRemoteCommand
    {
        public Guid Id { get; set; }
    }
}
