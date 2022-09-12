using System;
using System.Collections.Generic;
using System.Linq;
using Autofac;
using LeanCode;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Serilog.Events;

namespace FurnitureShop.Api
{
    public static class Config
    {
        public static class App
        {
            public static string PublicDomain(IConfiguration cfg) =>
                cfg.GetString("Domains:Public");

            public static string InternalApiDomain(IConfiguration cfg) =>
                cfg.GetString("Domains:ApiInternal");

            public static string InternalApiBase(IConfiguration cfg) =>
                $"http://{InternalApiDomain(cfg)}";

            public static string PublicComponent(IConfiguration cfg, string component) =>
                $"https://{component}.{PublicDomain(cfg)}";
        }

        public static class ConnectionString
        {
            public static string AzureServiceBusConnectionstring(IConfiguration cfg) =>
                cfg.GetConnectionString("ServiceBus"); // TODO ustawić AzureServiceBus
        }

        public static class SqlServer
        {
            public static string ConnectionString(IConfiguration cfg) =>
                cfg.GetString("SqlServer:ConnectionString");
        }

        public static class BlobStorage
        {
            public static string ConnectionString(IConfiguration cfg) =>
                cfg.GetString("BlobStorage:ConnectionString");

            public static string ModelsContainerName(IConfiguration cfg) =>
                cfg.GetString("BlobStorage:ModelsContainerName");

            public static string PhotosContainerName(IConfiguration cfg) =>
                cfg.GetString("BlobStorage:PhotosContainerName");
        }

        public static class Services
        {
            public static string[] AllowedOrigins(IConfiguration cfg) =>
                ExternalApps(cfg).Concat(new string[] { "http://localhost:51265", }).ToArray();

            public static string[] ExternalApps(IConfiguration cfg) =>
                cfg?.GetSection("CORS:External").Get<string[]>() ?? Array.Empty<string>();

            public static class Auth
            {
                public static string Address(IConfiguration cfg) =>
                    UrlHelper.Concat(App.InternalApiBase(cfg), "auth");

                public static string ExternalAddress(IConfiguration cfg) =>
                    UrlHelper.Concat(App.PublicComponent(cfg, "api"), "auth");
            }
        }

        public static class Logging
        {
            public static bool EnableDetailedInternalLogs(IConfiguration cfg) =>
                cfg.GetBool("Logging:EnableDetailedInternalLogs");

            public static LogEventLevel MinimumLevel(IConfiguration cfg) =>
                cfg.GetValue("Logging:MinimumLevel", LogEventLevel.Verbose);
        }

        private static string GetString(this IConfiguration configuration, string key)
        {
            return configuration.GetValue<string>(key);
        }

        private static bool GetBool(this IConfiguration configuration, string key)
        {
            return configuration.GetValue<bool>(key);
        }

        private static string GetService(this IConfiguration configuration, string rest)
        {
            return configuration.GetValue<string>($"Services:{rest}");
        }

        private static string GetSecret(this IConfiguration configuration, string api)
        {
            return configuration.GetValue<string>($"Secrets:{api}");
        }

        public static void RegisterConfig<TConfig>(this ContainerBuilder builder, TConfig config)
            where TConfig : class
        {
            builder.RegisterInstance(config).AsSelf().SingleInstance();
        }

        public static void RegisterMappedConfiguration(
            ContainerBuilder builder,
            IConfiguration config,
            IWebHostEnvironment hostEnv
        ) // tutaj rejstrujemy klasy z konfiguracjami poszczególnych usług
        { }
    }
}
