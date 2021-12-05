using System;

namespace FurnitureShop.Core.Domain
{
    public class Complaint
    {
        public Complaint(Order? order, Guid userId, string text)
        {
            this.Order = order;
            this.UserId = userId;
            this.Text = text;
            this.CreatedDate = DateTime.Now;
        }

        public Complaint(Guid userId, string text)
        {
            this.UserId = userId;
            this.Text = text;
            this.CreatedDate = DateTime.Now;
        }

        public Guid Id { get; set; }
        public Guid UserId { get; set; }
        public Order? Order { get; set; }
        public string Text { get; set; }
        public string? Response { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Resolved { get; set; }
    }
}
