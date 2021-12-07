using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Category : IAggregateRoot<Id<Category>>
    {
        public Id<Category> Id { get; set; }
        public string Name { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public Category(string name)
        {
            Name = name;
            Id = Id<Category>.New();
        }

        public Category()
        {
            Name = "";
            Id = Id<Category>.New();
        }
    }
}
