using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Domain
{
    public class Product
    {
        public Product(string name, string description, string modelUrl, Category? category)
        {
            this.Name = name;
            this.Description = description;
            this.ModelUrl = modelUrl;
            this.Category = category;
            this.Orders = new List<Order>();
        }

        public Product(string name, string description, string modelUrl)
        {
            this.Name = name;
            this.Description = description;
            this.ModelUrl = modelUrl;
            this.Orders = new List<Order>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ModelUrl { get; set; }
        public Category? Category { get; set; }
        public ICollection<Order> Orders { get; set; }
    }
}
