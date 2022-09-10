using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Shared.Products;

namespace FurnitureShop.Core.Contracts.Web.Products
{
    public class ProductDetailsDTO : ProductDTOBase
    {
        public Guid Id { get; set; }
        public string? ModelId { get; set; }
        public List<Guid> PhotosIds { get; set; }
    }
    public class CreateProdcutDTO : ProductDTOBase
    {
        public string? ModelId { get; set; }
        public List<Guid> PhotosIds { get; set; }
    }

    public class ProductDTO : ProductDTOBase
    {
        public Guid Id { get; set; }
    }
}
