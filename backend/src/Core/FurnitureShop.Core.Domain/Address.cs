using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class Address : IAggregateRoot<Id<Address>>
    {
        public Id<Address> Id { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }
        public Address(string street, string city, string state, string postalCode, string country)
        {
            Street = street;
            State = state;
            City = city;
            PostalCode = postalCode;
            Country = country;
            Id = Id<Address>.New();
        }

        public Address()
        {
            Street = "";
            State = "";
            City = "";
            PostalCode = "";
            Country = "";
            Id = Id<Address>.New();
        }
    }
}
