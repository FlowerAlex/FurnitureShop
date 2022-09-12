using System;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Shared.Products;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllProducts : SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }
    }
}
