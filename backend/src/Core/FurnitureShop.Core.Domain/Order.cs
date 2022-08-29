using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Order : IAggregateRoot<Id<Order>>
    {
        public Id<Order> Id { get; set; }
        public Id<User> UserId { get; set; }
        public Id<Complaint>? ComplaintId { get; set; }
        public List<OrderProduct> OrdersProducts { get; set; }
        public OrderState OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public string Address { get; set; }
        public double Price { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Order(string address)
        {
            Address = address;
            Id = Id<Order>.New();
            OrderState = OrderState.Pending;
            OrdersProducts = new List<OrderProduct>();
        }
    }

    public enum OrderState
    {
        Pending,
        Cancelled,
        InProgress,
        Finished,
    }
}
