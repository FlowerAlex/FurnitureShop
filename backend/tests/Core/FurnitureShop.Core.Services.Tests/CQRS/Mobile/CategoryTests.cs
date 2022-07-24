using System;
using System.Linq;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Web.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Web.Categories;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class CategoryTests : IDisposable
    {
        private readonly Category TestCategory = new Category("test_category");
        private readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public CategoryTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }

        [Fact]
        public void CategoryByIdQHTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CategoryByIdQH(dbContext);
            var command = new CategoryById { Id = TestCategory.Id };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var category = result.Result;
            Assert.NotNull(category);
            Assert.Equal(TestCategory.Name, category.Name);
            Assert.Equal(TestCategory.Id, category.Id);
        }
        [Fact]
        public void CreateCategoryTest()
        {
            string NewCategoryName = "new category";
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateCategoryCH(dbContext);
            var command = new CreateCategory { CategoryName = NewCategoryName };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var category = dbContext.Categories.Where(c => c.Name == NewCategoryName).FirstOrDefault();
            Assert.NotNull(category);
            Assert.Equal(NewCategoryName, category.Name);
        }
        [Fact]
        public void DeleteCategoryTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new DeleteCategoryCH(dbContext);
            var command = new DeleteCategory { Id = TestCategory.Id };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var category = dbContext.Categories.Find(TestCategory.Id);
            Assert.Null(category);
        }
        [Fact]
        public void UpdateCategoryTest()
        {
            string NewNameForCategory = "new name";
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new UpdateCategoryCH(dbContext);
            var command = new UpdateCategory { NewName = NewNameForCategory, Id = TestCategory.Id };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var category = dbContext.Categories.Where(c => c.Id == TestCategory.Id).FirstOrDefault();
            Assert.NotNull(category);
            Assert.Equal(NewNameForCategory, category.Name);
        }
    }
}
