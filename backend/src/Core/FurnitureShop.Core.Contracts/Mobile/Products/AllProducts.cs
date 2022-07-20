using System;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class AllProducts : SortablePaginatedQuery<ProductUSerViewDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }
    }
}
