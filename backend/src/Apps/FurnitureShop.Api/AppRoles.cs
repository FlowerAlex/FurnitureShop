using System.Collections.Generic;
using LeanCode.CQRS.Security;

using R = FurnitureShop.Core.Contracts.Auth.Roles;

namespace FurnitureShop.Api
{
    internal class AppRoles : IRoleRegistration
    {
        public IEnumerable<Role> Roles { get; } =
            new[] { new Role(R.User, R.User), new Role(R.Admin, R.Admin), };
    }
}
