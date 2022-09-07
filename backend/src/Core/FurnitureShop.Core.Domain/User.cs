using System;
using System.Collections.Generic;
using LeanCode.DomainModels.Model;
using LeanCode.Time;

namespace FurnitureShop.Core.Domain
{
    public class User : IAggregateRoot<Id<User>>
    {
        public Id<User> Id { get; private set; }

        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public int Funds { get; set; }
        public string Address { get; set; }
        public ICollection<Order> Orders { get; set; }
        public ICollection<Review> Reviews { get; set; }
        public ICollection<Complaint> Complaints { get; set; }
        public ICollection<UserProduct> Favourites { get; set; }
        byte[] IOptimisticConcurrency.RowVersion { get; set; } = Array.Empty<byte>();
        DateTime IOptimisticConcurrency.DateModified { get; set; }

        public User(
            string firstname,
            string surname,
            string username,
            string emailAddress,
            string address
        )
        {
            Id = Id<User>.New();
            Firstname = firstname;
            Surname = surname;
            Username = username;
            EmailAddress = emailAddress;
            Address = address;
            Funds = 0;
            Orders = new List<Order>();
            Reviews = new List<Review>();
            Complaints = new List<Complaint>();
            Favourites = new List<UserProduct>();
        }

        public void updateUser(
            string? firstname,
            string? surname,
            string? username,
            string? address
        )
        {
            if (firstname != null)
            {
                this.Firstname = firstname;
            }
            if (surname != null)
            {
                this.Surname = surname;
            }
            if (username != null)
            {
                this.Username = username;
            }
            if (address != null)
            {
                this.Address = address;
            }
        }
    }
}
