using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class UpdateComplaint : IRemoteCommand
    {
        public Guid Id { get; set; }
        public ComplaintInfoDTO ComplaintInfo { get; set; }
        public static class ErrorCodes
        {
            public const int EmptyComplaintText = 1;
        }
    }
}
