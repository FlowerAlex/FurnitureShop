using System;

namespace FurnitureShop.Core.Domain
{
    public class Review
    {
        public Review(Product? product, Guid userId, string text, double rating)
        {
            this.Product = product;
            this.UserId = userId;
            this.Text = text;
            this.Rating = rating;
            this.CreatedDate = DateTime.Now;
        }

        public Review(Guid userId, string text, double rating)
        {
            this.UserId = userId;
            this.Text = text;
            this.Rating = rating;
            this.CreatedDate = DateTime.Now;
        }

        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public Product? Product { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
