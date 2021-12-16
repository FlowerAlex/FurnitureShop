using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    // [AuthorizeWhenHasAnyOf(Auth.Roles.User,Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class CreateComplaint : IRemoteCommand
    {
        public ComplaintInfoDTO ComplaintInfoDTO { get; set; }
        public static class ErrorCodes
        {

        }
    }
}
