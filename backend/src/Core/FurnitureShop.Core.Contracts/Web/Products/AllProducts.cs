using System;
using LeanCode.CQRS.Security;
namespace FurnitureShop.Core.Contracts.Web.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllProducts : SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }
    }
}
