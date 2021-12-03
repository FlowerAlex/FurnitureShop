using System;

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
        }

        public Product(string name, string description, string modelUrl)
        {
            this.Name = name;
            this.Description = description;
            this.ModelUrl = modelUrl;
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string ModelUrl { get; set; }
        public Category? Category { get; set; }
    }
}
