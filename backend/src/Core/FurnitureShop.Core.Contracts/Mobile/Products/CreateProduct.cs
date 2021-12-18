using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Products
{
    //[AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    [AllowUnauthorized]
    public class CreateProduct : IRemoteCommand
    {
        public ProductInfoDTO ProductInfo { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectName = 1;
            public const int IncorrectDescription = 2;
            public const int IncorrectPrice = 3;
        }
    }
}
