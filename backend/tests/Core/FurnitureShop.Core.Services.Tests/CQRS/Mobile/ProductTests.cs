using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS;
using FurnitureShop.Core.Services.CQRS.Mobile.Products;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class ProductTests : IDisposable
    {
        private readonly Category TestCategory = new Category("test_category");
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100)
        {
            ModelUrl = "https://some.url.com",
        };
        private readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        
        private string NewProductName = "new Product";
        private string NewProdctDescription = "new desc";
        private string NewProductModelUrl = "new model url";
        private decimal NewProductPrice = 111;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();

            TestProduct.CategoryId = context.Categories.Where(c => c.Name == TestCategory.Name).FirstOrDefault().Id;
            context.Products.Add(TestProduct);
            context.SaveChanges();
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public ProductTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }

        [Fact]
        public void ProductByIdQHTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new ProductByIdQH(dbContext);
            var command = new ProductById { Id = TestProduct.Id };
            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var Product = result.Result;
            Assert.NotNull(Product);
            Assert.Equal(TestProduct.Name, Product.ProductInfo.Name);
            Assert.Equal(TestProduct.Description, Product.ProductInfo.Description);
            Assert.Equal(TestProduct.ModelUrl, Product.ProductInfo.ModelUrl);
            Assert.Equal(TestProduct.Price, Product.ProductInfo.Price);
            Assert.Equal(TestProduct.CategoryId, Product.ProductInfo.CategoryId);
            Assert.Equal(TestProduct.Id, Product.Id);
        }
        [Fact]
        public void CreateProductTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateProductCH(dbContext);
            var command = new CreateProduct
            {
                ProductInfo = new ProductInfoDTO
                {
                    Name = NewProductName,
                    Description = NewProdctDescription,
                    ModelUrl = NewProductModelUrl,
                    Price = NewProductPrice,
                }
            };
            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var Product = dbContext.Products.Where(c => c.Name == NewProductName).FirstOrDefault();
            Assert.NotNull(Product);
            Assert.Equal(NewProductName, Product.Name);
            Assert.Equal(NewProdctDescription, Product.Description);
            Assert.Equal(NewProductModelUrl, Product.ModelUrl);
            Assert.Equal(NewProductPrice, Product.Price);
            Assert.Null(Product.CategoryId);
        }
        [Fact]
        public void DeleteProductTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new DeleteProductCH(dbContext);
            var command = new DeleteProduct { Id = TestProduct.Id };
            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var Product = dbContext.Products.Find(TestProduct.Id);
            Assert.Null(Product);
        }
        [Fact]
        public void UpdateProductTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new UpdateProductCH(dbContext);
            var command = new UpdateProduct
            {
                Id = TestProduct.Id,
                ProductInfo = new ProductInfoDTO
                {
                    Name = NewProductName,
                    Description = NewProdctDescription,
                    ModelUrl = NewProductModelUrl,
                    Price = NewProductPrice,
                }
            };
            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var Product = dbContext.Products.Where(c => c.Name == NewProductName).FirstOrDefault();
            Assert.NotNull(Product);
            Assert.Equal(NewProductName, Product.Name);
            Assert.Equal(NewProdctDescription, Product.Description);
            Assert.Equal(NewProductModelUrl, Product.ModelUrl);
            Assert.Equal(NewProductPrice, Product.Price);
            Assert.Null(Product.CategoryId);
        }
    }
}
