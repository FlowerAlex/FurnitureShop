using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    public class OrderInfoDTO
    {
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<ProductDTO> Products { get; set; }
    }

    public class OrderDTO
    {
        public Guid Id { get; set; }
        public OrderInfoDTO OrderInfo { get; set; }
    }
}
