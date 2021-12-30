using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class CreateCategory : IRemoteCommand
    {
        public string CategoryName { get; set; }
        public static class ErrorCodes
        {
            public const int EmptyArgs = 1;
        }
    }
}
