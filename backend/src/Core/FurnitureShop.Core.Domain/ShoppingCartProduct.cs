using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class ShoppingCartProduct : IAggregateRoot<Id<ShoppingCartProduct>>
    {
        
        public Id<ShoppingCartProduct> Id { get; set; }
        public Id<ShoppingCart>? ShoppingCartId { get; set; }
        public Id<Product>? ProductId { get; set; }
        public int Amount { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public ShoppingCartProduct()
        {          
            Id = Id<ShoppingCartProduct>.New();
        }
    }
}