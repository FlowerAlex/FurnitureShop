using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace FurnitureShop.Api.Handlers
{
    public static class ReadinessProbe
    {
        public static Task HandleAsync(HttpContext ctx)
        {
            ctx.Response.StatusCode = 200;
            return ctx.Response.WriteAsync("Ready");
        }
    }
}
