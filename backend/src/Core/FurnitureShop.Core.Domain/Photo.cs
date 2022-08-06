using System;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Domain
{
    public class Photo : IAggregateRoot<Id<Photo>>
    {
        public Id<Photo> Id { get; set; }
        public Id<Product> ProductId { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public Photo(Id<Photo> id, Id<Product> productId)
        {
            ProductId = productId;
            Id = id;
        }
    }
}
