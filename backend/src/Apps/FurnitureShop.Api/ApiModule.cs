using System;
using Autofac;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.AzureIdentity;
using LeanCode.Components;
using LeanCode.OpenTelemetry;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpOverrides;
using Microsoft.Extensions.Azure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using OpenTelemetry.Resources;
using OpenTelemetry.Trace;

namespace FurnitureShop.Api
{
    internal class ApiModule : AppModule
    {
        internal const string ApiCorsPolicy = "Api";

        private readonly IConfiguration config;
        private readonly IWebHostEnvironment hostEnv;

        public ApiModule(IConfiguration config, IWebHostEnvironment hostEnv)
        {
            this.config = config;
            this.hostEnv = hostEnv;
        }

        public override void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(ConfigureCORS);
            services.AddRouting();
            services.AddHealthChecks()
                .AddDbContextCheck<CoreDbContext>();

            services.Configure<ForwardedHeadersOptions>(options =>
            {
                options.ForwardedHeaders = ForwardedHeaders.All;
                options.KnownNetworks.Clear();
                options.KnownProxies.Clear();
            });

            services.AddAzureClients(cfg =>
            {
                cfg.AddBlobServiceClient(Config.BlobStorage.ConnectionString(config));
            });
        }

        protected override void Load(ContainerBuilder builder)
        {
            Config.RegisterMappedConfiguration(builder, config, hostEnv);

            builder.RegisterType<AppRoles>()
                .AsImplementedInterfaces();
        }

        private void ConfigureCORS(CorsOptions opts)
        {
            opts.AddPolicy(ApiCorsPolicy, cfg =>
            {
                cfg
                    .WithOrigins(Config.Services.AllowedOrigins(config))
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials()
                    .SetPreflightMaxAge(TimeSpan.FromMinutes(60));
            });
        }
    }
}
