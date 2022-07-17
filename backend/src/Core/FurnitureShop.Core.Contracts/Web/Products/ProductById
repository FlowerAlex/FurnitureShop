using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Web.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class ProductById : IRemoteQuery<ProductWithDetailsDTO?>
    {
        public Guid Id { get; set; }
    }
}
