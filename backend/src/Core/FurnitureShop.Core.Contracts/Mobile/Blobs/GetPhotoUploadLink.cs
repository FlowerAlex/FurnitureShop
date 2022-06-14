using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Blobs
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class GetPhotoUploadLink : IRemoteQuery<string>
    {
        public string BlobName { get; set; }
        public static class ErrorCodes
        {
            public const int ConnectionError = 1;
        }
    }
}