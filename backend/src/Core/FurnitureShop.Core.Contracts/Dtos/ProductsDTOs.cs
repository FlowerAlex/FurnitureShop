using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Dtos
{
    public class ProductDTOBase
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public double? AverageRating { get; set; }
        public string? PreviewPhotoURL { get; set; }
        public Guid? CategoryId { get; set; }
    }
    public class ProductWithDetailsDTOBase : ProductDTOBase
    {
        public string Description { get; set; }
        public string? ModelUrl { get; set; }
    }

    public class ProductWithDetailsDTO : ProductWithDetailsDTOBase
    {
        public Guid Id { get; set; }
    }
    public class ProductDTO : ProductDTOBase
    {
        public Guid Id { get; set; }
    }
    public class ProductUDTO : ProductDTO
    {
        public bool InFavourites { get; set; }
        public bool InShoppingCart { get; set; }
    }
    public class ProductWithDetailsUDTO : ProductWithDetailsDTO
    {
        public bool InFavourites { get; set; }
        public bool InShoppingCart { get; set; }
    }
    public enum ProductsSortFieldDTO
    {
        Name = 0,
        Rating = 1,
        Price = 2,
    }
}
