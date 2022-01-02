using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class UpdateProfile : IRemoteCommand
    {
        public String? Firstname { get; set; }
        public String? Surname { get; set; }
        public String? Username { get; set; }
    }
}
