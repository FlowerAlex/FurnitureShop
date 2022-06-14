using System.Reflection;
using Autofac;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.DataAccess.Entities;
using FurnitureShop.Core.Services.DataAccess.Repositories;
using FurnitureShop.Core.Services.Services;
using LeanCode.Components;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

namespace FurnitureShop.Core.Services
{
    public class CoreModule : AppModule
    {
        private readonly string connectionString;
        private readonly string blobConnectionString;
        private readonly string modelsContainerName;
        private readonly string photosContainerName;

        public CoreModule(string connectionString, string blobConnectionString, string modelsContainerName, string photosContainerName)
        {
            this.connectionString = connectionString;
            this.blobConnectionString = blobConnectionString;
            this.modelsContainerName = modelsContainerName;
            this.photosContainerName = photosContainerName;
        }

        public override void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<CoreDbContext>(opts =>
                opts.UseSqlServer(connectionString, cfg =>
                    cfg.MigrationsAssembly("FurnitureShop.Migrations")));

            services.AddIdentity<AuthUser, AuthRole>()
                .AddEntityFrameworkStores<CoreDbContext>()
                .AddDefaultTokenProviders();
            
            services.Configure<IdentityOptions>(options =>
            {
                options.User.AllowedUserNameCharacters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&'*+-/=?^_`{|}~.""(),:;<>@[\] ";
                options.Password.RequiredLength = IdentityUserManager.MinimalPasswordLength;
                options.Password.RequireDigit = false;
                options.Password.RequireLowercase = false;
                options.Password.RequireNonAlphanumeric = false;
                options.Password.RequireUppercase = false;
            });

            services.AddTransient<IBlobStorageService,BlobStorageService>(/*b => new BlobStorageService(blobConnectionString,modelsContainerName,photosContainerName)*/);
        }

        protected override void Load(ContainerBuilder builder)
        {
            var self = typeof(CoreModule).Assembly;

            builder.Register(c => c.Resolve<CoreDbContext>())
                .AsImplementedInterfaces();

            builder.RegisterAssemblyTypes(self)
                .InNamespaceOf<IdentityUserManager>()
                .AsSelf()
                .AsImplementedInterfaces();

            builder.RegisterAssemblyTypes(self)
                .InNamespaceOf<UsersRepository>()
                .AsImplementedInterfaces();
        }
    }
}
