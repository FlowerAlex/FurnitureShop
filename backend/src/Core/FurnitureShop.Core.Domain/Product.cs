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
        public string ModelUrl { get; set; }
        public decimal Price { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<Order> Orders { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public Product(string name, string description, string modelUrl)
        {
            Id = Id<Product>.New();
            Name = name;
            Description = description;
            ModelUrl = modelUrl;
            Orders = new List<Order>();
            Reviews = new List<Review>();
        }

        public Product()
        {
            Id = Id<Product>.New();
            Name = "";
            Description = "";
            ModelUrl = "";
            Orders = new List<Order>();
            Reviews = new List<Review>();
        }
    }
}
