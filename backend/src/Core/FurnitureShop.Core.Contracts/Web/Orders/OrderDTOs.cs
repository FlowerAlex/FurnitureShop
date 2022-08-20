using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Web.Products;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    public class OrderDTOBase
    {
        public Guid? UserId { get; set; }
        public double Price { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public string OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<ProductInOrderDTO> Products { get; set; }
    }

    public class OrderDTO : OrderDTOBase
    {
        public Guid Id { get; set; }
    }
    public class ProductInOrderDTO :ProductDTO
    {
        public int Amount { get; set; }
    }
    public enum OrderStateDTO
    {
        Pending,
        Cancelled,
        InProgress,
        Finished,
    }
}
