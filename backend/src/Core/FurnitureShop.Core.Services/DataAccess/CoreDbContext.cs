using System;
using System.Threading;
using System.Threading.Tasks;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess.Entities;
using LeanCode.DomainModels.EF;
using LeanCode.DomainModels.MassTransitRelay.Inbox;
using LeanCode.DomainModels.MassTransitRelay.Outbox;
using LeanCode.DomainModels.Model;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace FurnitureShop.Core.Services.DataAccess
{
    public class CoreDbContext :
        IdentityDbContext<AuthUser, AuthRole, Guid>,
        IOutboxContext,
        IConsumedMessagesContext
    {
        public DbContext Self => this;
        public DbSet<AuthUser> AuthUsers => base.Users;
        public new DbSet<User> Users => Set<User>();
        public DbSet<ConsumedMessage> ConsumedMessages => Set<ConsumedMessage>();
        public DbSet<RaisedEvent> RaisedEvents => Set<RaisedEvent>();
        public DbSet<Category> Categories => Set<Category>();
        public DbSet<Product> Products => Set<Product>();
        public DbSet<Review> Reviews => Set<Review>();
        public DbSet<Complaint> Complaints => Set<Complaint>();
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

            builder.Entity<User>(b =>
            {
                b.HasKey(u => u.Id);
                b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
                b.HasMany(u => u.Orders)
                    .WithOne()
                    .HasPrincipalKey(u => u.Id)
                    .HasForeignKey(o => o.UserId)
                    .OnDelete(DeleteBehavior.SetNull);
                b.HasMany(u => u.Reviews)
                    .WithOne()
                    .HasPrincipalKey(u => u.Id)
                    .HasForeignKey(r => r.UserId)
                    .OnDelete(DeleteBehavior.ClientCascade);
                b.HasMany(u => u.Complaints)
                    .WithOne()
                    .HasPrincipalKey(u => u.Id)
                    .HasForeignKey(c => c.UserId)
                    .OnDelete(DeleteBehavior.ClientCascade);
            });

            builder.Entity<Category>(b =>
            {
                b.HasKey(c => c.Id);
                b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
                b.HasMany<Product>()
                    .WithOne()
                    .HasForeignKey(p => p.CategoryId)
                    .OnDelete(DeleteBehavior.SetNull);
            });

            builder.Entity<Product>(b =>
            {
                b.HasKey(p => p.Id);
                b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
                b.Property(e => e.CategoryId).IsTypedId();
                b.HasMany<Review>()
                    .WithOne()
                    .HasPrincipalKey(p => p.Id)
                    .HasForeignKey(r => r.ProductId)
                    .OnDelete(DeleteBehavior.ClientCascade);
            });
            builder.Entity<OrderProduct>(o =>
           {
               o.HasKey(o => o.Id);
               o.Property(o => o.Id).ValueGeneratedNever().IsTypedId();
               o.Property(o => o.OrderId).IsTypedId();
               o.Property(o => o.ProductId).IsTypedId();
               o.HasOne<Order>()
                   .WithMany(ord => ord.OrdersProducts)
                   .HasForeignKey(o => o.OrderId);
               o.HasOne<Product>()
                   .WithMany(p => p.OrdersProducts)
                   .HasForeignKey(o => o.ProductId);
           });
            builder.Entity<Order>(b =>
           {
               b.HasKey(o => o.Id);
               b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
               b.Property(e => e.UserId).IsTypedId();
               b.HasOne<Complaint>()
                   .WithOne()
                   .HasForeignKey<Order>(o => o.ComplaintId)
                   .OnDelete(DeleteBehavior.ClientCascade);
           });
            builder.Entity<Review>(b =>
            {
                b.HasKey(r => r.Id);
                b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
                b.Property(e => e.UserId).IsTypedId();
                b.Property(e => e.ProductId).IsTypedId();
            });
            builder.Entity<Complaint>(b =>
            {
                b.HasKey(c => c.Id);
                b.Property(e => e.Id).ValueGeneratedNever().IsTypedId();
                b.Property(e => e.UserId).IsTypedId();
                b.Property(e => e.OrderId).IsTypedId();
            });
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
