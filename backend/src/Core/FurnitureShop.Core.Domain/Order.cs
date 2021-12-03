using System;
using System.Collections.Generic;

namespace FurnitureShop.Core.Domain
{
    public class Order
    {
        public Order(ICollection<Product> products)
        {
            this.Products = products;
        }

        public Order()
        {
            this.Products = new List<Product>();
        }

        public Guid Id { get; set; }
        public ICollection<Product> Products { get; set; }
    }
}
