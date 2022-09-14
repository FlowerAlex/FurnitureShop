using System;

namespace FurnitureShop.Core.Contracts.Web.Reviews
{
    public class ReviewDTO
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string UserName { get; set; }
        public Guid ProductId { get; set; }
        public string ProductName { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
