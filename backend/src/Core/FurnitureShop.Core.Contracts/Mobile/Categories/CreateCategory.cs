using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Categories
{
    [AllowUnauthorized]
    public class AddCategory : IRemoteCommand
    {
        public string CategoryName { get; set; }
        public static class ErrorCodes
        {
            public const int EmptyArgs = 1;
        }
    }
}
