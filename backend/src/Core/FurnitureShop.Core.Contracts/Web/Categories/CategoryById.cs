using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Web.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class CategoryById : IRemoteQuery<CategoryDTO?>
    {
        public Guid Id { get; set; }
    }
}
