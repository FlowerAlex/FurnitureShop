using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    public class ProductDTO
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
        public decimal Price { get; set; }
        public string Name { get; set; }
        public string ModelUrl { get; set; }
    }
}
