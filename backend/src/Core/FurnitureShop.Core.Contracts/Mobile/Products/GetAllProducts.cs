using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class GetAllProducts : IRemoteQuery<List<ProductWithDetailsDTO>>
    {
        public Guid? CategoryId { get; set; }
    }
}
