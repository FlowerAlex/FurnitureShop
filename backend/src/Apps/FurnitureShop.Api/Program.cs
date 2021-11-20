using System.Threading.Tasks;
using LeanCode.Components;
using LeanCode.Components.Startup;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Hosting;

namespace FurnitureShop.Api
{
    public class Program
    {
        public static Task Main()
        {
            return CreateWebHostBuilder().Build().RunAsync();
        }

        public static IHostBuilder CreateWebHostBuilder()
        {
            return LeanProgram
                .BuildMinimalHost<Startup>()
                .ConfigureDefaultLogging("FurnitureShop", TypesCatalog.Of<Startup>());
        }
    }
}
