using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
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
    }

    public class OrderDTO : OrderDTOBase
    {
        public Guid Id { get; set; }
        public List<ProductInOrderDTO> Products { get; set; }
    }
    public class CreateOrderDTO : OrderDTOBase
    {
        public List<ProductInOrderCreateDTO> Products { get; set; }

    }
    public class ProductInOrderDTO : ProductDTO
    {
        public int Amount { get; set; }
    }
    public class ProductInOrderCreateDTO
    {   
        public Guid Id { get; set; }
        public int Amount { get; set; }
    }
}
