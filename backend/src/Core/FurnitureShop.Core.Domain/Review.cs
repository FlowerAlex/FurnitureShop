using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Review : IAggregateRoot<Id<Review>>
    {
        public Id<Review> Id { get; set; }
        public Id<User> UserId { get; set; }
        public Id<Product> ProductId { get; set; }
        public string? Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Review(double rating)
        {
            Id = Id<Review>.New();
            Rating = rating;
            CreatedDate = DateTime.Now;
        }
    }
}
