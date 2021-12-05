using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Domain
{
    public class Order
    {
        public Order(ICollection<Product> products, Guid userId, Guid deliveryAddressId)
        {
            this.Products = products;
            this.UserId = userId;
            this.DeliveryAddressId = deliveryAddressId;
        }

        public Order(Guid userId)
        {
            this.Products = new List<Product>();
            this.UserId = userId;
        }

        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public ICollection<Product> Products { get; set; }
        public Guid? ComplaintId { get; set; }
        public Guid DeliveryAddressId { get; set; }
        public OrderState State { get; set; }
    }

    public enum OrderState
    {
        Pending,
        Cancelled,
        InProgress,
        Finished,
    }
}
