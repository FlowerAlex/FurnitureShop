using System;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Favourites
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class MyFavourites : SortablePaginatedQuery<ProductDTO, ProductsSortFieldDTO?>
    {
        public Guid? CategoryId { get; set; }

    }
}
