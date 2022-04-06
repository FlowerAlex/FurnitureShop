using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    public class ProductDetailsDTO : ProductInfoDTO
    {
        public string Description { get; set; }
        public string? ModelUrl { get; set; }
    }
    public class ProductInfoDTO
    {
        public string Name { get; set; }
        public decimal Price { get; set; }
        public double? AverageRating { get; set; }
        public string? PreviewPhotoURL { get;set; }
        public Guid? CategoryId { get; set; }
    }

    public class ProductWithDetailsDTO 
    {
        public Guid Id { get; set; }
        public ProductDetailsDTO ProductDetails { get; set; }
    }
    public class ProductDTO
    {
        public Guid Id { get; set; }
        public ProductInfoDTO ProductInfo { get; set; }
    }
}
