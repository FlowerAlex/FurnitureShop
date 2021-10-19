using System.Threading.Tasks;
using FurnitureShop.Api.Helpers;
using Microsoft.AspNetCore.Http;

namespace FurnitureShop.Api.Handlers
{
    public static class VersionHandler
    {
        public static Task HandleAsync(HttpContext ctx)
        {
            ctx.Response.StatusCode = 200;
            return ctx.Response.WriteAsync(VersionHelper.Version);
        }
    }
}
