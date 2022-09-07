using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UpdateProfile : IRemoteCommand
    {
        public String? Firstname { get; set; }
        public String? Surname { get; set; }
        public String? Username { get; set; }
        public String? Address { get; set; }
    }
}
