using System;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Mobile.Categories;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class CategoryTests : IDisposable
    {
        private readonly Category TestCategory = new Category("test_category");
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
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
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CategoryByIdQH(dbContext);
            var command = new CategoryById{Id = TestCategory.Id};
            //var result = handler.ExecuteAsync(dbContext,command);
            //Aser
        }
    }
}
