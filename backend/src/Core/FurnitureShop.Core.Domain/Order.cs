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
        public List<OrderProduct> OrdersProducts { get; set; }
        public OrderState OrderState { get; set; }
        public DateTime OrderedDate { get; set; }
        public DateTime? DeliveredDate { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public decimal Price { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Order(string street, string city, string state, string postalCode, string country)
        {
            Street = street;
            State = state;
            City = city;
            PostalCode = postalCode;
            Country = country;
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
