using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.ShoppingCart;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS;
using FurnitureShop.Core.Services.CQRS.Mobile.ShoppingCart;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class ShoppingCartTests : IDisposable
    {
        private readonly Category TestCategory = new Category("test_category");
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100)
        {
            ModelUrl = "https://some.url.com",
        };
        private readonly Product TestProduct2 = new Product("test_Product2", "Product_for_test2", 200);
        private readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        private readonly ShoppingCart TestShoppingCart = new ShoppingCart();
        private readonly ShoppingCartProduct TestShoppingCartProduct = new ShoppingCartProduct();
        private readonly int TestProductAmount = 3;
        private string NewProductName = "new Product";
        private string NewProdctDescription = "new desc";
        private string NewProductModelUrl = "new model url";
        private decimal NewProductPrice = 111;
        private readonly string TestUserRole = Auth.Roles.User;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();

            TestProduct.CategoryId = TestCategory.Id;
            context.Products.Add(TestProduct);
            context.SaveChanges();

            TestShoppingCartProduct.ProductId = TestProduct.Id;
            TestShoppingCartProduct.ShoppingCartId = TestShoppingCart.Id;
            TestShoppingCartProduct.Amount = TestProductAmount;

            TestShoppingCart.ShoppingCartProducts = new List<ShoppingCartProduct> { TestShoppingCartProduct };
            TestShoppingCart.UserId = Id<User>.From(TestUserId);

            context.ShoppingCartProduct.Add(TestShoppingCartProduct);
            context.ShoppingCarts.Add(TestShoppingCart);
            context.SaveChanges();
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public ShoppingCartTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }
        [Fact]
        public void GetShoppingCartQHTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new GetShoppingCartQH(dbContext);
            var command = new GetShoppingCart{ShoppingCartId = TestShoppingCart.Id};
            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var ShoppingCart = result.Result;
            Assert.NotNull(ShoppingCart);
            Assert.Equal(TestShoppingCart.ShoppingCartProducts.Count,ShoppingCart.ShoppingCartInfo.ShoppingCartProducts.Count());
            Assert.Equal(TestShoppingCart.Id,ShoppingCart.Id);
            Assert.Equal(TestShoppingCart.UserId,ShoppingCart.ShoppingCartInfo.UserId);
            Assert.Equal(TestProduct.Price *TestProductAmount,ShoppingCart.ShoppingCartInfo.Price);
            Assert.Equal(TestShoppingCartProduct.ProductId.Value,ShoppingCart.ShoppingCartInfo.ShoppingCartProducts.First().Product.Id);
            Assert.Equal(TestProductAmount,ShoppingCart.ShoppingCartInfo.ShoppingCartProducts.First().Amount);
        }
        [Fact]
        public void AddProductToShoppingCartTest()
        {
            int productAmount = 4;
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new AddProductsToShoppingCartCH(dbContext);
            var command = new AddProductsToShoppingCart
            {
                ProductId = TestProduct2.Id,
                ShoppingCartId = TestShoppingCart.Id,
                Amount = productAmount,
            };

            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            var Shpc = dbContext.ShoppingCarts.Where(p => p.Id == TestShoppingCart.Id).First();
            Assert.Equal(2,Shpc.ShoppingCartProducts.Count);
            var addedProduct = Shpc.ShoppingCartProducts.Where(p => p.ProductId == TestProduct2.Id).First();
            Assert.Equal(TestProduct2.Id,addedProduct.ProductId);
            Assert.Equal(productAmount,addedProduct.Amount);
            Assert.Equal(Shpc.Id,addedProduct.ShoppingCartId);
        }
        [Fact]
        public void RemoveProductFromShoppintCartTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new RemoveProductFromShoppingCartCH(dbContext);
            var command = new RemoveProductFromShoppingCart
            {
                ProductId = TestProduct.Id,
                ShoppingCartId = TestShoppingCart.Id,
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var ShoppingCartProduct = dbContext.ShoppingCartProduct.Find(TestShoppingCartProduct.Id);
            Assert.Null(ShoppingCartProduct);
        }
    }
}
