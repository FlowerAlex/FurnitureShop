using System;

namespace FurnitureShop.Core.Contracts.Web.Users
{
    public class UserInfoDTO
    {
        public Guid Id { get; set; }
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public string Address { get; set; }
        public int Funds { get; set; }
        public bool IsBanned { get; set; }
    }
}
