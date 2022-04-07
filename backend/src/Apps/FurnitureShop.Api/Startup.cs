using System.Collections.Generic;
using FurnitureShop.Api.Auth;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using FurnitureShop.Core.Domain.Example.Events;
using FurnitureShop.Core.Services;
using LeanCode.Components;
using LeanCode.Components.Startup;
using LeanCode.CQRS.Cache;
using LeanCode.CQRS.Default;
using LeanCode.CQRS.RemoteHttp.Server;
using LeanCode.CQRS.Security;
using LeanCode.CQRS.Validation;
using LeanCode.CQRS.Validation.Fluent;
using LeanCode.DomainModels.MassTransitRelay;
using LeanCode.DomainModels.MassTransitRelay.Middleware;
using LeanCode.Localization;
using LeanCode.OpenTelemetry;
using LeanCode.ViewRenderer.Razor;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Swashbuckle.AspNetCore;

namespace FurnitureShop.Api
{
    public class Startup : LeanStartup
    {
        private static readonly RazorViewRendererOptions ViewOptions = new("Templates");

        private static readonly TypesCatalog AllHandlers = new(typeof(CoreContext));
        private static readonly TypesCatalog Api = new(typeof(CreateCategory));
        private static readonly TypesCatalog Domain = new(typeof(ExampleEvent));

        private readonly IWebHostEnvironment hostEnv;

        protected override IAppModule[] Modules { get; }

        public Startup(IWebHostEnvironment hostEnv, IConfiguration config)
            : base(config)
        {
            this.hostEnv = hostEnv;
            Modules = ConfigureModules(hostEnv, config);
        }

        protected static IAppModule[] ConfigureModules(IWebHostEnvironment hostEnv, IConfiguration config)
        {
            var dbConnStr = Config.SqlServer.ConnectionString(config);

            var modules = new List<IAppModule>
            {
                new ApiModule(config, hostEnv),
                new CoreModule(dbConnStr),
                new AuthModule(hostEnv, config),

                new CQRSModule()
                    .WithCustomPipelines<CoreContext>(
                        AllHandlers,
                        c => c.Secure().Validate().StoreAndPublishEvents(),
                        q => q.Secure()),
                new FluentValidationModule(AllHandlers),
                new MassTransitRelayModule(AllHandlers, Domain, MassTransitConfiguration.ConfigureBus(config, hostEnv)),
                new LocalizationModule(LocalizationConfiguration.For<Strings.Strings>()),
            };

            return modules.ToArray();
        }
        protected override void ConfigureApp(IApplicationBuilder app)
        {
            app
                .UseRouting()
                .UseForwardedHeaders()
                .UseCors(ApiModule.ApiCorsPolicy);

            app.Map("/auth", auth => auth.UseIdentityServer());
            
            app.Map("/api", api =>
                    api
                        .UseAuthentication()
                        .UseRemoteCQRS(
                            Api,
                            CoreContext.FromHttp));

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapHealthChecks("/live/health");
            });

            app.UseSwagger();
            app.UseSwaggerUI();
        }
    }
}
