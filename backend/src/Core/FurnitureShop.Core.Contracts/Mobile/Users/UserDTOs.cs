using System;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    public class UserInfoDTOBase
    {
        public string Firstname { get; set; }
        public string Surname { get; set; }
        public string Username { get; set; }
        public string EmailAddress { get; set; }
        public string Address { get; set; }
    }
    public class UserInfoDTO : UserInfoDTOBase
    {
        public int Funds { get; set; }
    }
}
