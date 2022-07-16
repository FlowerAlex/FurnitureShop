using System;

namespace FurnitureShop.Core.Contracts.Dtos
{
    public class ReviewDTO
    {
        public Guid Id { get; set; }
        public ReviewInfoDTO ReviewInfo { get; set; }
    }
    public class ReviewInfoDTO
    {
        public Guid? UserId { get; set; }
        public Guid? ProductId { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
