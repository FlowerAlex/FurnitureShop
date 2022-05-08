using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class CategoryById : IRemoteQuery<CategoryDTO?>
    {
        public Guid Id { get; set; }
    }
}
