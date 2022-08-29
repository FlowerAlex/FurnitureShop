using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Web.Products
{
    public class ProductDTOBase
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public double? AverageRating { get; set; }
        public string? PreviewPhotoId { get; set; }
        public Guid? CategoryId { get; set; }
    }

    public class ProducDetailsDTOBase : ProductDTOBase
    {
        public string Description { get; set; }
        public string? ModelId { get; set; }
        public List<Guid> PhotosIds { get; set; }
    }

    public class ProductDetailsDTO : ProducDetailsDTOBase
    {
        public Guid Id { get; set; }
    }

    public class ProductDTO : ProductDTOBase
    {
        public Guid Id { get; set; }
    }

    public enum ProductsSortFieldDTO
    {
        Name = 0,
        Rating = 1,
        Price = 2,
    }
}
