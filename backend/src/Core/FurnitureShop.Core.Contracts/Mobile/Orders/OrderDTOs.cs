using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Addresses;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    public class OrderDTO
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public decimal Price { get; set; }
        public AddressDTO DeliveryAddress { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<ProductDTO> Products { get; set; }
    }
}
