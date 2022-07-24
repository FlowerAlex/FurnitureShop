using System;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    public class ProductDTOBase
    {
        public string Name { get; set; }
        public double Price { get; set; }
        public double? AverageRating { get; set; }
        public string? PreviewPhotoURL { get; set; }
        public Guid? CategoryId { get; set; }
        public bool InFavourites { get; set; }
        public bool InShoppingCart { get; set; }
    }
    public class ProducDetailsDTOBase : ProductDTOBase
    {
        public string Description { get; set; }
        public string? ModelUrl { get; set; }
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
