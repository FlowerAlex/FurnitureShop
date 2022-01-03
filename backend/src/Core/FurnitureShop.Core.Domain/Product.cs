using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Product : IAggregateRoot<Id<Product>>
    {
        public Id<Product> Id { get; set; }
        public Id<Category>? CategoryId { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string? ModelUrl { get; set; }
        public string? PreviewPhotoUrl { get; set; }
        public decimal Price { get; set; }
        public double AvergeRating { get; set; }
        public List<Review> Reviews { get; set; }
        public List<OrderProduct> OrdersProducts { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Product(string name, string description, decimal price)
        {
            Id = Id<Product>.New();
            Name = name;
            Description = description;
            Price = price;
            OrdersProducts = new List<OrderProduct>();
            Reviews = new List<Review>();
        }
    }
}
