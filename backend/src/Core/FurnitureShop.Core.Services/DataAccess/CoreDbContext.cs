using System;
using System.Threading;
using System.Threading.Tasks;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.DomainModels.MassTransitRelay.Inbox;
using LeanCode.DomainModels.MassTransitRelay.Outbox;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.DataAccess
{
    public class CoreDbContext :
        IdentityDbContext<AuthUser, AuthRole, Guid>,
        IOutboxContext,
        IConsumedMessagesContext
    {
        public DbContext Self => this;
        public DbSet<ConsumedMessage> ConsumedMessages => Set<ConsumedMessage>();
        public DbSet<RaisedEvent> RaisedEvents => Set<RaisedEvent>();
        public DbSet<Category> Categories => Set<Category>();
        public DbSet<Product> Products => Set<Product>();
        public DbSet<Order> Orders => Set<Order>();

        public CoreDbContext(DbContextOptions<CoreDbContext> options)
            : base(options)
        { }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);
            builder.HasDefaultSchema("dbo");

            ConsumedMessage.Configure(builder);
            RaisedEvent.Configure(builder);

            ConfigureAuth(builder);

            builder.Entity<Product>()
                .HasOne(p => p.Category)
                .WithMany();

            builder.Entity<Order>()
                .HasMany(o => o.Products)
                .WithMany(p => p.Orders);

            builder.Entity<Address>()
                .HasOne<Order>()
                .WithOne()
                .HasForeignKey<Order>(o => o.DeliveryAddressId);

            builder.Entity<Order>()
                .HasOne<AuthUser>()
                .WithMany()
                .HasForeignKey(o => o.UserId);

            builder.Entity<Review>()
                .HasOne(r => r.Product)
                .WithMany(p => p.Reviews);

            builder.Entity<Review>()
                .HasOne<AuthUser>()
                .WithMany()
                .HasForeignKey(r => r.UserId);

            builder.Entity<Complaint>()
                .HasOne<Order>(c => c.Order)
                .WithOne()
                .HasForeignKey<Order>(o => o.ComplaintId)
                .OnDelete(DeleteBehavior.NoAction);

            builder.Entity<Complaint>()
                .HasOne<AuthUser>()
                .WithMany()
                .HasForeignKey(c => c.UserId);
        }

        public Task CommitAsync(CancellationToken cancellationToken = default) => SaveChangesAsync(cancellationToken);

        private static void ConfigureAuth(ModelBuilder builder)
        {
            builder.Entity<AuthUser>(b =>
            {
                b.HasMany(u => u.Claims)
                    .WithOne()
                    .HasPrincipalKey(e => e.Id)
                    .HasForeignKey(e => e.UserId);
                b.ToTable("AspNetUsers", "auth");
            });
            builder.Entity<AuthRole>(b => b.ToTable("AspNetRoles", "auth"));
            builder.Entity<IdentityUserClaim<Guid>>(b => b.ToTable("AspNetUserClaims", "auth"));
            builder.Entity<IdentityRoleClaim<Guid>>(b => b.ToTable("AspNetRoleClaims", "auth"));
            builder.Entity<IdentityUserRole<Guid>>(b => b.ToTable("AspNetUserRoles", "auth"));
            builder.Entity<IdentityUserLogin<Guid>>(b => b.ToTable("AspNetUserLogins", "auth"));
            builder.Entity<IdentityUserToken<Guid>>(b => b.ToTable("AspNetUserTokens", "auth"));
        }
    }
}
