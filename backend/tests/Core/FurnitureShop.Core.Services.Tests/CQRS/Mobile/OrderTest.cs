using System;
using System.Linq;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Mobile.Orders;
using FurnitureShop.Core.Services.CQRS.Web.Orders;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class OrderTests : IDisposable
    {
        private readonly string testAddress = "test_address1";
        private readonly Category TestCategory = new Category("test_category");
        private readonly Order TestOrder = new Order("test_address")
        {
            UserId = Id<User>.From(TestUserId),
        };
        private readonly Order TestOrder2 = new Order("test_address2")
        {
            UserId = Id<User>.From(TestUserId),
            OrderState = OrderState.Cancelled,
        };
        private readonly int testProductAmount = 3;
        private readonly int testProductAmount2 = 2;
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100)
        {
            ModelId = "https://some.url.com",
        };
        private readonly Product TestProduct2 = new Product("test_Product2", "Product_for_test2", 120)
        {
            ModelId = "https://some.url2.com",
        };
        private readonly Domain.ShoppingCart TestShoppingCart = new Domain.ShoppingCart();
        private readonly ShoppingCartProduct TestShoppingCartProduct = new ShoppingCartProduct();
        private readonly int TestShpProductAmount = 2;
        private static readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            
            TestShoppingCartProduct.ProductId = TestProduct.Id;
            TestShoppingCartProduct.ShoppingCartId = TestShoppingCart.Id;
            TestShoppingCartProduct.Amount = TestShpProductAmount;

            TestShoppingCart.ShoppingCartProducts = new List<ShoppingCartProduct> { TestShoppingCartProduct };
            TestShoppingCart.UserId = Id<User>.From(TestUserId);
            
            context.ShoppingCartProduct.Add(TestShoppingCartProduct);

            context.ShoppingCarts.Add(TestShoppingCart);
            context.SaveChanges();

            context.Categories.Add(TestCategory);
            context.SaveChanges();
            context.Products.Add(TestProduct);
            context.SaveChanges();
            context.Products.Add(TestProduct2);
            context.SaveChanges();
            context.Orders.Add(TestOrder);
            context.Orders.Add(TestOrder2);
            context.SaveChanges();
            TestOrder.OrdersProducts = new List<OrderProduct>()
            {
                new OrderProduct(){
                    ProductId = TestProduct.Id,
                    OrderId = TestOrder.Id,
                    Amount = testProductAmount,
                },
                new OrderProduct(){
                    ProductId = TestProduct2.Id,
                    OrderId = TestOrder.Id,
                    Amount = testProductAmount2,
                },
            };
            context.SaveChanges();
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public OrderTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }
        [Fact]
        public void CreateOrderTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateOrderQH(dbContext);
            var command = new CreateOrder
            {
                Address = "some address",
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.Address == "some address").FirstOrDefault();
            Assert.NotNull(Order);
            Assert.Equal("some address", Order.Address);
            Assert.Equal(OrderState.Pending, Order.OrderState);
             Assert.Equal(1, Order.OrdersProducts.Count);
        //     Assert.True(TestProduct.Id == Order.OrdersProducts[0].ProductId || TestProduct.Id == Order.OrdersProducts[1].ProductId);
        //     Assert.True(testProductAmount == Order.OrdersProducts[0].Amount || testProductAmount == Order.OrdersProducts[1].Amount, $"{testProductAmount}, expected {Order.OrdersProducts[0].Amount} or {Order.OrdersProducts[1].Amount}");
        //     Assert.True(2 == Order.OrdersProducts[0].Amount || 2 == Order.OrdersProducts[1].Amount, $"{testProductAmount2}, expected {Order.OrdersProducts[0].Amount} or {Order.OrdersProducts[1].Amount}");
        }
        [Fact]
        public void GetAllOrdersTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.AllOrdersQH(dbContext);
            var command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy = new Dictionary<FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO, string>(),
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Orders = dbContext.Orders.ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());

            command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy = new Dictionary<FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO, string>(),
            };
            command.FilterBy.Add(FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO.OrderState, "Cancelled");

            result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Orders = dbContext.Orders.Where(o => o.OrderState == OrderState.Cancelled).ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());

            command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy = new Dictionary<FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO, string>(),
            };
            command.FilterBy.Add(FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO.Address, "test_address2");

            result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Orders = dbContext.Orders.Where(o => o.Address == "test_address2").ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());
        }
        [Fact]
        public void OrderByIdTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.OrderByIdQH(dbContext);
            var command = new FurnitureShop.Core.Contracts.Web.Orders.OrderById() { Id = TestOrder.Id };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(o => o.Id == TestOrder.Id).Include(o => o.OrdersProducts).FirstOrDefault();
            Assert.Equal(TestOrder.Address, Order.Address);
            Assert.Equal(TestOrder.Address, Order.Address);
            Assert.Equal(TestOrder.UserId, Order.UserId);
            Assert.Equal(TestOrder.OrdersProducts.Count(), Order.OrdersProducts.Count);
            var prod1 = TestOrder.OrdersProducts[0];
            var prod2 = TestOrder.OrdersProducts[1];
            Assert.True(prod1.ProductId == Order.OrdersProducts[0].ProductId || prod1.ProductId == Order.OrdersProducts[1].ProductId);
            Assert.True(prod2.ProductId == Order.OrdersProducts[0].ProductId || prod2.ProductId == Order.OrdersProducts[1].ProductId);
            Assert.True(prod1.Amount == Order.OrdersProducts[0].Amount || prod1.Amount == Order.OrdersProducts[1].Amount);
            Assert.True(prod2.Amount == Order.OrdersProducts[0].Amount || prod2.Amount == Order.OrdersProducts[1].Amount);
        }
        [Fact]
        public void SetOrderStateTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.SetOrderStateCH(dbContext);
            var command = new FurnitureShop.Core.Contracts.Web.Orders.SetOrderState()
            {
                Id = TestOrder.Id,
                OrderState =FurnitureShop.Core.Contracts.Web.Orders.OrderStateDTO.InProgress,
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.Id == TestOrder.Id).FirstOrDefault();
            Assert.Equal(OrderState.InProgress, Order.OrderState);
        }
    }
}
