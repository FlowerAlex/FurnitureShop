using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Complaint : IAggregateRoot<Id<Complaint>>
    {
        public Id<Complaint> Id { get; set; }
        public Id<User>? UserId { get; set; }
        public Id<Order>? OrderId { get; set; }
        public string Text { get; set; }
        public string? Response { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Resolved { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public Complaint(string text)
        {
            Id = Id<Complaint>.New();
            Text = text;
            CreatedDate = DateTime.Now;
        }

        public Complaint()
        {
            Id = Id<Complaint>.New();
            Text = "";
            CreatedDate = DateTime.Now;
        }
    }
}
