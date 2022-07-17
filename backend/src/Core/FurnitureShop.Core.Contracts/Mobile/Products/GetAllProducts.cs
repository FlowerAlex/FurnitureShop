using System;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class GetAllProducts : SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }
    }
}
