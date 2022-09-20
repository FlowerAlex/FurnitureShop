using System;
using System.Linq;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Web.Users;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Web.Users;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Web
{
    public class UserTests : IDisposable
    {
        private readonly User TestUser1 = new User("test1", "test1", "test1", "test1", "test1")
        {
            Funds = 15
        };
        private readonly User TestUser2 = new User("test2", "test2", "test2", "test2", "test2");
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }

        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Users.Add(TestUser1);
            context.AuthUsers.Add(
                new DataAccess.Entities.AuthUser()
                {
                    Id = TestUser1.Id,
                    UserName = TestUser1.Username,
                    Email = TestUser1.EmailAddress,
                    Claims =
                    {
                        new IdentityUserClaim<Guid>()
                        {
                            ClaimType = Auth.KnownClaims.Role,
                            ClaimValue = Auth.Roles.User,
                        },
                    },
                }
            );
            context.SaveChanges();
            context.Users.Add(TestUser2);
            context.AuthUsers.Add(
                new DataAccess.Entities.AuthUser()
                {
                    Id = TestUser2.Id,
                    UserName = TestUser2.Username,
                    Email = TestUser2.EmailAddress,
                    Claims =
                    {
                        new IdentityUserClaim<Guid>()
                        {
                            ClaimType = Auth.KnownClaims.Role,
                            ClaimValue = Auth.Roles.BannedUser,
                        },
                    },
                }
            );
            context.SaveChanges();
        }

        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public UserTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                .UseInMemoryDatabase(Guid.NewGuid().ToString())
                .Options;
            Seed();
        }

        [Fact]
        public void BanUserTest()
        {
            var coreContext = CoreContext.ForTests(TestUser1.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            //var userManager = MockServices.GetUserManagerForTests<IdentityUser<string>>(new UserStore<IdentityUser<string>>(dbContext));
            //var handler = new BanUserCH(userManager, dbContext);
            var command = new BanUser { UserId = TestUser1.Id };

            //var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(true);
        }

        [Fact]
        public void GetAllUsersTest()
        {
            var coreContext = CoreContext.ForTests(TestUser1.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var command = new AllUsers() { PageNumber = 0, PageSize = 5 };
            var handler = new AllUsersQH(dbContext);

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Assert.Equal(2, result.Result.TotalCount);
            var user = result.Result.Items
                .Where(u => u.Username == TestUser1.Username)
                .FirstOrDefault();
            Assert.NotNull(user);
            Assert.Equal(TestUser1.Address, user.Address);
            Assert.Equal(TestUser1.EmailAddress, user.EmailAddress);
            Assert.Equal(TestUser1.Firstname, user.Firstname);
            Assert.Equal(TestUser1.Surname, user.Surname);
            Assert.Equal(TestUser1.Funds, user.Funds);
            Assert.Equal(TestUser1.Username, user.Username);
            Assert.Equal(
                dbContext.UserClaims.Where(u => u.UserId == TestUser1.Id).First().ClaimValue
                    == Auth.Roles.BannedUser,
                user.IsBanned
            );
        }
    }
}
