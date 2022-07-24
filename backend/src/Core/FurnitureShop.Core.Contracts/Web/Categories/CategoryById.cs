using System;
using FurnitureShop.Core.Contracts.Shared.Categories;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class CategoryById : IRemoteQuery<CategoryDTO?>
    {
        public Guid Id { get; set; }
    }
}
