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
        private readonly Order TestOrder = new Order("test_address");
        private readonly Order TestOrder2 = new Order("test_address2")
        {
            OrderState = OrderState.Cancelled,
        };
        private readonly User TestUser = new User("test", "test", "test", "test", "test");
        private readonly int testProductAmount = 3;
        private readonly int testProductAmount2 = 2;
        private readonly int UserFunds = 5000;
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100)
        {
            ModelId = "https://some.url.com",
        };
        private readonly Product TestProduct2 = new Product(
            "test_Product2",
            "Product_for_test2",
            120
        )
        {
            ModelId = "https://some.url2.com",
        };
        private readonly Domain.ShoppingCart TestShoppingCart = new Domain.ShoppingCart();
        private readonly ShoppingCartProduct TestShoppingCartProduct = new ShoppingCartProduct();
        private readonly int TestShpProductAmount = 2;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }

        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            TestUser.Funds = UserFunds;
            TestOrder.UserId = TestUser.Id;
            TestOrder2.UserId = TestUser.Id;
            TestShoppingCartProduct.ProductId = TestProduct.Id;
            TestShoppingCartProduct.ShoppingCartId = TestShoppingCart.Id;
            TestShoppingCartProduct.Amount = TestShpProductAmount;

            TestShoppingCart.ShoppingCartProducts = new List<ShoppingCartProduct>
            {
                TestShoppingCartProduct
            };
            TestShoppingCart.UserId = TestUser.Id;
            context.Users.Add(TestUser);
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
                new OrderProduct()
                {
                    ProductId = TestProduct.Id,
                    OrderId = TestOrder.Id,
                    Amount = testProductAmount,
                },
                new OrderProduct()
                {
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
            var coreContext = CoreContext.ForTests(TestUser.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateOrderQH(dbContext);
            var command = new CreateOrder
            {
                NewOrder = new CreateOrderDTO
                {
                    Address = "some address",
                    Products = new List<ProductInOrderCreateDTO>
                    {
                        new ProductInOrderCreateDTO
                        {
                            Id = TestProduct.Id,
                            Amount = TestShpProductAmount,
                        }
                    }
                }
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.Address == "some address").FirstOrDefault();
            Assert.NotNull(Order);
            Assert.Equal("some address", Order.Address);
            Assert.Equal(OrderState.Pending, Order.OrderState);
            Assert.Equal(1, Order.OrdersProducts.Count);
            Assert.False(
                dbContext.ShoppingCarts
                    .Include(s => s.ShoppingCartProducts)
                    .Where(s => s.UserId == TestUser.Id)
                    .First()
                    .ShoppingCartProducts.Any()
            );
            Assert.Equal(TestProduct.Id, Order.OrdersProducts.First().ProductId);
            Assert.Equal(
                UserFunds - TestProduct.Price * testProductAmount,
                dbContext.Users.Where(u => u.Id == TestUser.Id).First().Funds
                    - TestProduct.Price * TestShpProductAmount
            );
        }

        [Fact]
        public void GetAllOrdersTest()
        {
            var coreContext = CoreContext.ForTests(TestUser.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.AllOrdersQH(dbContext);
            var command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy =
                    new Dictionary<
                        FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO,
                        string
                    >(),
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Orders = dbContext.Orders.ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());

            command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy =
                    new Dictionary<
                        FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO,
                        string
                    >(),
            };
            command.FilterBy.Add(
                FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO.OrderState,
                "Cancelled"
            );

            result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Orders = dbContext.Orders.Where(o => o.OrderState == OrderState.Cancelled).ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());

            command = new FurnitureShop.Core.Contracts.Web.Orders.AllOrders()
            {
                FilterBy =
                    new Dictionary<
                        FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO,
                        string
                    >(),
            };
            command.FilterBy.Add(
                FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO.Address,
                "test_address2"
            );

            result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Orders = dbContext.Orders.Where(o => o.Address == "test_address2").ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());
        }

        [Fact]
        public void OrderByIdTest()
        {
            var coreContext = CoreContext.ForTests(TestUser.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.OrderByIdQH(dbContext);
            var command = new FurnitureShop.Core.Contracts.Web.Orders.OrderById()
            {
                Id = TestOrder.Id
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders
                .Where(o => o.Id == TestOrder.Id)
                .Include(o => o.OrdersProducts)
                .FirstOrDefault();
            Assert.Equal(TestOrder.Address, Order.Address);
            Assert.Equal(TestOrder.Address, Order.Address);
            Assert.Equal(TestOrder.UserId, Order.UserId);
            Assert.Equal(TestOrder.OrdersProducts.Count(), Order.OrdersProducts.Count);
            var prod1 = TestOrder.OrdersProducts[0];
            var prod2 = TestOrder.OrdersProducts[1];
            Assert.True(
                prod1.ProductId == Order.OrdersProducts[0].ProductId
                    || prod1.ProductId == Order.OrdersProducts[1].ProductId
            );
            Assert.True(
                prod2.ProductId == Order.OrdersProducts[0].ProductId
                    || prod2.ProductId == Order.OrdersProducts[1].ProductId
            );
            Assert.True(
                prod1.Amount == Order.OrdersProducts[0].Amount
                    || prod1.Amount == Order.OrdersProducts[1].Amount
            );
            Assert.True(
                prod2.Amount == Order.OrdersProducts[0].Amount
                    || prod2.Amount == Order.OrdersProducts[1].Amount
            );
        }

        [Fact]
        public void SetOrderStateTest()
        {
            var coreContext = CoreContext.ForTests(TestUser.Id, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new FurnitureShop.Core.Services.CQRS.Web.Orders.SetOrderStateCH(
                dbContext
            );
            var command = new FurnitureShop.Core.Contracts.Web.Orders.SetOrderState()
            {
                Id = TestOrder.Id,
                OrderState = FurnitureShop.Core.Contracts.Web.Orders.OrderStateDTO.InProgress,
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.Id == TestOrder.Id).FirstOrDefault();
            Assert.Equal(OrderState.InProgress, Order.OrderState);
        }
    }
}
