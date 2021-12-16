using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class UpdateComplaint : IRemoteCommand
    {
        public Guid Id { get; set; }
        public ComplaintInfoDTO ComplaintInfoDTO { get; set; }
        public static class ErrorCodes
        {

        }
    }
}
