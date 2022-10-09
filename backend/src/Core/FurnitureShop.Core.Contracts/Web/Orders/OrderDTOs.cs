using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Contracts.Web.Complaints;
using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Contracts.Web.Orders
{
    public class OrderDTOBase
    {
        public Guid? UserId { get; set; }
        public double Price { get; set; }
        public string Adress { get; set; }
        public OrderStateDTO OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public List<ProductInOrderDTO> Products { get; set; }
    }

    public class OrderDTO : OrderDTOBase
    {
        public Guid Id { get; set; }
        public ComplaintDTO? Complaint { get; set; }
    }

    public class ProductInOrderDTO : ProductDTO
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
