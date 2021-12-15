using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Users
{
    [AllowUnauthorized]
    public class RegisterUser : IRemoteCommand
    {
        public UserInfoDTO UserInfoDTO { get; set; }
        public string Password { get; set; }

        public static class ErrorCodes
        {
            public const int UserDTOIsNull = 1;
            public const int PasswordTooWeak = 2;
        }
    }
}
