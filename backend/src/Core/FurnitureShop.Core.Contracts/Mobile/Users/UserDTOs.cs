using System;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    public class UserInfoDTO
    {
        public string Firstname { get; private set; }
        public string Surname { get; private set; }
        public string Username { get; private set; }
        public string EmailAddress { get; private set; }
    }
}
