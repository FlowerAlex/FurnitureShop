using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    public class DeleteComplaint : IRemoteCommand
    {
        public Guid Id { get; set; }
    }
}
