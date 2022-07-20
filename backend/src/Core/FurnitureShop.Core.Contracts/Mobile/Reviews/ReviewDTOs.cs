using System;

namespace FurnitureShop.Core.Contracts.Mobile.Reviews
{
    public class ReviewDTO : ReviewDTOBase
    {
        public Guid Id { get; set; }
    }
    public class ReviewDTOBase
    {
        public Guid? UserId { get; set; }
        public Guid? ProductId { get; set; }
        public string Text { get; set; }
        public double Rating { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
