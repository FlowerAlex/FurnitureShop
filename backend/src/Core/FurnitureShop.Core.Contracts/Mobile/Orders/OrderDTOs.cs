using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Shared.Orders;

namespace FurnitureShop.Core.Contracts.Mobile.Orders
{
    public class OrderDTO 
    {
        public Guid Id { get; set; }
        public List<ProductInOrderDTO> Products { get; set; }
        public Guid? UserId { get; set; }
        public double Price { get; set; }
        public string Address { get; set; }
        public OrderStateDTO OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
    }

    public class CreateOrderDTO
    {
        public string? Address { get; set; }
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
