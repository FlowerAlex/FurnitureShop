using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    public class NewOrderDTO
    {
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public List<OrderProductDTO> OrderProducts { get; set; }
    }

    public class OrderDTO
    {
        public Guid Id { get; set; }
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<OrderProductDTO> OrderProducts { get; set; }
    }
    public class OrderProductDTO
    {
        public Guid? ProductId { get; set; }
        public int Amount { get; set; }
    }
}
