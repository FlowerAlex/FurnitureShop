using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class ResolveComplaint : IRemoteCommand
    {
        public Guid Id { get; set; }
    }
}
