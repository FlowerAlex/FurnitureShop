using System;

namespace FurnitureShop.Core.Domain
{
    public class Address
    {
        public Address(string street, string city, string state, string postalCode, string country)
        {
            this.Street = street;
            this.State = state;
            this.City = city;
            this.PostalCode = postalCode;
            this.Country = country;
        }

        public Guid Id { get; set; }
        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
    }
}
