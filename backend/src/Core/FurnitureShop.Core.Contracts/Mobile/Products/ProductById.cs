using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class ProductById : IRemoteQuery<ProductDetailsUserViewDTO?>
    {
        public Guid Id { get; set; }
    }
}
