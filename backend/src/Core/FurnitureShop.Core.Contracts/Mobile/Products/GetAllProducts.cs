using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class GetAllProducts : SortablePaginatedQuery<ProductDTO,ProductsSortFieldDTO>
    {
        public Guid CategoryId { get; set; }
    }
    public enum ProductsSortFieldDTO
    {
        Name = 0,
        Rating = 1,       
    }
}
