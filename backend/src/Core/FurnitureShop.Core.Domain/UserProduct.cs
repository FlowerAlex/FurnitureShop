using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class UserProduct : IAggregateRoot<Id<UserProduct>>
    {
        public Id<UserProduct> Id { get; set; }
        public Id<User>? UserId { get; set; }
        public Id<Product>? ProductId { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public UserProduct()
        {
            Id = Id<UserProduct>.New();
        }
    }
}
