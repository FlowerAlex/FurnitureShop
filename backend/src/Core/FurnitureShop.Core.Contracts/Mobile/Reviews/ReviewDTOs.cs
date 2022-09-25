using System;
using FurnitureShop.Core.Contracts.Shared;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    public class ReviewDTO
    {
        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public string UserName { get; set; }
        public Guid ProductId { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public class AddReviewDTO
    {
        public Guid ProductId { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public class UpdateReviewDTO
    {
        public Guid Id { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
    }
    public class AllReviewsDTO : PaginatedResult<ReviewDTO>
    {
        public ReviewDTO? MyReview { get; set; }
    }
}
