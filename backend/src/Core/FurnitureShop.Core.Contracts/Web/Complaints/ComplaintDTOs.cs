using System;

namespace FurnitureShop.Core.Contracts.Web.Complaints
{
    public class ComplaintDTO 
    {
        public Guid UserId { get; set; }
        public Guid OrderId { get; set; }
        public string Text { get; set; }
        public string? Response { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Resolved { get; set; }
        public Guid Id { get; set; }
    }
    public class RespondToComplaintDTO
    {
        public Guid OrderId { get; set; }
        public string Text { get; set; }
    }
}
