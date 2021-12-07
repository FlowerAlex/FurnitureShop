using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class User : IAggregateRoot<Id<User>>
    {
        public Id<User> Id { get; private set; }

        public string Firstname { get; private set; }
        public string Surname { get; private set; }
        public string Username { get; private set; }
        public string EmailAddress { get; private set; }
        public ICollection<Order> Orders { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<Complaint> Complaints { get; set; }

        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public User(
            string firstname,
            string surname,
            string username,
            string emailAddress)
        {
            Id = Id<User>.New();
            Firstname = firstname;
            Surname = surname;
            Username = username;
            EmailAddress = emailAddress;
            Orders = new List<Order>();
            Reviews = new List<Review>();
            Complaints = new List<Complaint>();
        }

        public User()
        {
            Id = Id<User>.New();
            Firstname = "";
            Surname = "";
            Username = "";
            EmailAddress = "";
            Orders = new List<Order>();
            Reviews = new List<Review>();
            Complaints = new List<Complaint>();
        }
    }
}
