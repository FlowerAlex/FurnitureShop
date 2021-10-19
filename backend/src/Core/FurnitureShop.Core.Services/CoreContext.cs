using System;
using System.Security.Claims;
using System.Threading;
using LeanCode.CQRS.Security;
using LeanCode.Pipelines;
using FurnitureShop.Core.Contracts;
using Microsoft.AspNetCore.Http;

namespace FurnitureShop.Core.Services
{
    public class CoreContext : ISecurityContext
    {
        IPipelineScope IPipelineContext.Scope { get; set; } = null!;

        public ClaimsPrincipal User { get; }
        public CancellationToken CancellationToken { get; }

        private CoreContext(ClaimsPrincipal user, CancellationToken cancellationToken)
        {
            User = user;
            CancellationToken = cancellationToken;
        }

        public static CoreContext FromHttp(HttpContext httpContext)
        {
            return new CoreContext(httpContext.User, httpContext.RequestAborted);
        }

        private static CoreContext ForTests(Guid userId, string role)
        {
            var claims = new[]
            {
                new Claim(Auth.KnownClaims.UserId, userId.ToString()),
                new Claim(Auth.KnownClaims.Role, role),
            };

            var user = new ClaimsPrincipal(new ClaimsIdentity(
                claims: claims,
                authenticationType: "internal",
                nameType: Auth.KnownClaims.UserId,
                roleType: Auth.KnownClaims.Role));

            return new CoreContext(user, default);
        }

        private Guid ParseUserClaim(string claimType)
        {
            if (User?.Identity?.IsAuthenticated ?? false)
            {
                var str = User.FindFirstValue(claimType);
                Guid.TryParse(str, out var res);
                return res;
            }
            else
            {
                return Guid.Empty;
            }
        }
    }
}
