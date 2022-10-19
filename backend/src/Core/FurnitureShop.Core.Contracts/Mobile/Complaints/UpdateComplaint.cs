using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class UpdateComplaint : IRemoteCommand
    {
        public UpdateComplaintDTO UpdatedComplaint { get; set; }

        public static class ErrorCodes
        {
            public const int EmptyComplaintText = 1;
        }
    }
}
