using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Shared.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    public class ProductDTO : ProductDTOBase
    {
        public Guid Id { get; set; }
        public bool InFavourites { get; set; }
        public bool InShoppingCart { get; set; }
    }

    public class ProductDetailsDTO : ProductDTO
    {
        public string? ModelId { get; set; }
        public List<Guid> PhotoIds { get; set; }
    }
}
