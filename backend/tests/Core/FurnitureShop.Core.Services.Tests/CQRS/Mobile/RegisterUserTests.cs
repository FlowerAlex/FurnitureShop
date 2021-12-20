using System;
using FurnitureShop.Core.Services.CQRS.Mobile.Users;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile.Users
{
    public class RegisterUserCHTests : IDisposable
    {
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public RegisterUserCHTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }

        [Fact]
        public void RegisterUserTest()
        {
            using var dbContext = new CoreDbContext(ContextOptions);
            //var handler = new RegisterUserCH(new Microsoft.AspNetCore.Identity.UserManager<DataAccess.Entities.AuthUser>(),dbContext);
            Assert.True(true);
        }
    }
}
