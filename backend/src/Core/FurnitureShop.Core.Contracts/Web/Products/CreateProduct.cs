using LeanCode.CQRS;
using LeanCode.CQRS.Security;
namespace FurnitureShop.Core.Contracts.Web.Products
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class CreateProduct : IRemoteCommand
    {
        public ProducDetailsDTOBase NewProduct { get; set; }
        public static class ErrorCodes
        {
            public const int IncorrectName = 1;
            public const int IncorrectDescription = 2;
            public const int IncorrectPrice = 3;
        }
    }
}
