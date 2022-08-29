using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class UpdateProfile : IRemoteCommand
    {
        public string? Firstname { get; set; }
        public string? Surname { get; set; }
        public string? Username { get; set; }
    }
}
