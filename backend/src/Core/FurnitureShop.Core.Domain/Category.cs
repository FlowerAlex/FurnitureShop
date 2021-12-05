using System;

namespace FurnitureShop.Core.Domain
{
    public class Category
    {
        public Category(string name)
        {
            this.Name = name;
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}
