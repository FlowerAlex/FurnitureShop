using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Shared.Products
{
    public class ProductDTOBase
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public double? AverageRating { get; set; }
        public string? PreviewPhotoId { get; set; }
        public Guid? CategoryId { get; set; }
    }
    public enum ProductsSortFieldDTO
    {
        Name = 0,
        Rating = 1,
        Price = 2,
    }
}
