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
using LeanCode.DomainModels.Model;
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
        private readonly Product TestProduct2 = new Product("test_Product2", "Product_for_test2", 120)
        {
            ModelUrl = "https://some.url2.com",
        };
        private readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");

        private string NewProductName = "new Product";
        private string NewProdctDescription = "new desc";
        private string NewProductModelUrl = "new model url";
        private double NewProductPrice = 111;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();

            TestProduct.CategoryId = TestCategory.Id;
            context.Products.Add(TestProduct);
            context.Products.Add(TestProduct2);
            context.SaveChanges();

            context.Favourites.Add(new UserProduct(){UserId = Id<User>.From(TestUserId), ProductId = TestProduct2.Id});
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
            Assert.Equal(TestProduct.Name, Product.ProductDetails.Name);
            Assert.Equal(TestProduct.Description, Product.ProductDetails.Description);
            Assert.Equal(TestProduct.ModelUrl, Product.ProductDetails.ModelUrl);
            Assert.Equal(TestProduct.Price, Product.ProductDetails.Price);
            Assert.Equal(TestProduct.CategoryId, Product.ProductDetails.CategoryId);
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
                ProductDetails = new ProductDetailsDTO
                {
                    Description = NewProdctDescription,
                    ModelUrl = NewProductModelUrl,
                    Name = NewProductName,
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
                ProductDetails = new ProductDetailsDTO
                {
                    Description = NewProdctDescription,
                    ModelUrl = NewProductModelUrl,
                    Name = NewProductName,
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
        public void AddToFavouritesTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new AddToFavouritesCH(dbContext);
            var command = new AddToFavourites
            {
                Id = TestProduct.Id,
            };

            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var favourite = dbContext.Favourites.Where(f => f.UserId == TestUserId && f.ProductId == TestProduct.Id).First();
            Assert.Equal(TestProduct.Id,favourite.ProductId);
        }
        [Fact] 
        public void RemoveFromFavouritesTest()
        {     
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);            
            var handler = new RemoveFromFavouritesCH(dbContext);
            var command = new RemoveFromFavourites
            {
                Id = TestProduct2.Id,
            };

            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            bool isFavourtie = dbContext.Favourites.Where(f => f.UserId == TestUserId && f.ProductId == TestProduct2.Id).Any();
            Assert.False(isFavourtie);
        }
    }
}
