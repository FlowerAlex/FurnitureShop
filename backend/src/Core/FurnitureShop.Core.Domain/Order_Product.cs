using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Order_Product : IAggregateRoot<Id<Order_Product>>
    {
        
        public Id<Order_Product> Id { get; set; }
        public Id<Order>? OrderId { get; set; }
        public Id<Product>? ProductId { get; set; }
        public int Amount { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

    }
}