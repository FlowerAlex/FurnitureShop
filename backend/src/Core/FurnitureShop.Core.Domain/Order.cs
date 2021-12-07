using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Order : IAggregateRoot<Id<Order>>
    {
        public Id<Order> Id { get; set; }
        public Id<User>? UserId { get; set; }
        public Id<Complaint>? ComplaintId { get; set; }
        public Id<Address>? AddressId { get; set; }
        public ICollection<Product> Products { get; set; }
        public OrderState State { get; set; }
        public decimal Price { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public Order()
        {
            Id = Id<Order>.New();
            State = OrderState.Pending;
            Products = new List<Product>();
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
