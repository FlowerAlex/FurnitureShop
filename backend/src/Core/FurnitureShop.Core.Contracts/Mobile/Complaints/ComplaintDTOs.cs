using System;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    public class ComplaintDTOBase
    {
        public Guid UserId { get; set; }
        public Guid OrderId { get; set; }
        public string Text { get; set; }
        public string? Response { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Resolved { get; set; }
    }

    public class ComplaintDTO : ComplaintDTOBase
    {
        public Guid Id { get; set; }
    }
}
