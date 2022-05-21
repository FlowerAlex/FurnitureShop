using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    public class ProductById : IRemoteQuery<ProductWithDetailsDTO?>
    {
        public Guid Id { get; set; }
    }
}
