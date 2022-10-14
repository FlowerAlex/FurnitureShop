using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class RespondToComplaint : IRemoteCommand
    {
        public Guid Id { get; set; }
        public string Response { get; set; }
    }
}
