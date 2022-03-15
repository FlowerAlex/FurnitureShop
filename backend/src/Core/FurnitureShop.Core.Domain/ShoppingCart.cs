using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;
namespace FurnitureShop.Core.Domain
{
    public class ShoppingCart : IAggregateRoot<Id<ShoppingCart>>
    {
        public Id<ShoppingCart> Id { get; set; }
        public Id<User>? UserId { get; set; }
        public List<ShoppingCartProduct> ShoppingCartProducts { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public ShoppingCart()
        {
            Id = Id<ShoppingCart>.New();
            ShoppingCartProducts = new List<ShoppingCartProduct>();
        }
    }
}
