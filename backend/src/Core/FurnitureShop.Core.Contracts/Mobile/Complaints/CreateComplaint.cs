using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class CreateComplaint : IRemoteCommand
    {
        public ComplaintDTOBase ComplaintInfo { get; set; }

        public static class ErrorCodes
        {
            public const int EmptyComplaintText = 1;
        }
    }
}
