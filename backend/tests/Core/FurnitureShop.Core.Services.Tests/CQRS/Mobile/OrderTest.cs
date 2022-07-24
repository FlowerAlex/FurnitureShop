using System;
using System.Linq;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Mobile.Orders;
using FurnitureShop.Core.Services.CQRS.Shared.Orders;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class OrderTests : IDisposable
    {
        private readonly string testStreet = "test_street1";
        private readonly string testCity = "test_city1";
        private readonly string testState = "test_state1";
        private readonly string testPostalCode = "test_postal_code1";
        private readonly string testCountry = "test_country1";
        private readonly Category TestCategory = new Category("test_category");
        private readonly Order TestOrder = new Order("test_street", "test_city",
            "test_state", "test_postal_code", "test_country")
        {
            UserId = Id<User>.From(TestUserId),
        };
        private readonly Order TestOrder2 = new Order("test_street2", "test_city2",
           "test_state2", "test_postal_code2", "test_country2")
        {
            UserId = Id<User>.From(TestUserId),
            OrderState = OrderState.Cancelled,
        };
        private readonly int testProductAmount = 3;
        private readonly int testProductAmount2 = 2;
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100)
        {
            ModelUrl = "https://some.url.com",
        };
        private readonly Product TestProduct2 = new Product("test_Product2", "Product_for_test2", 120)
        {
            ModelUrl = "https://some.url2.com",
        };
        private static readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();
            context.Products.Add(TestProduct);
            context.SaveChanges();
            context.Products.Add(TestProduct2);
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
            context.Orders.Add(TestOrder);
            context.Orders.Add(TestOrder2);
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
                NewOrder = new OrderDTOBase
                {
                    Country = testCountry,
                    State = testState,
                    City = testCity,
                    Street = testStreet,
                    PostalCode = testPostalCode,
                    Products = new List<ProductInOrderDTO>
                    {
                        new ProductInOrderDTO()
                        {
                            Product = new ProductDTO()
                            {
                                Id = TestProduct.Id,
                            },
                            Amount = testProductAmount,
                        },
                        new ProductInOrderDTO()
                        {
                            Product = new ProductDTO()
                            {
                                Id = TestProduct2.Id,
                            },
                            Amount = testProductAmount2,
                        }
                    }
                }
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.City == testCity).FirstOrDefault();
            Assert.NotNull(Order);
            Assert.Equal(testStreet, Order.Street);
            Assert.Equal(testCity, Order.City);
            Assert.Equal(testState, Order.State);
            Assert.Equal(testCountry, Order.Country);
            Assert.Equal(OrderState.Pending, Order.OrderState);
            Assert.Equal(2, Order.OrdersProducts.Count);
            Assert.True(TestProduct.Id == Order.OrdersProducts[0].ProductId || TestProduct.Id == Order.OrdersProducts[1].ProductId);
            //Assert.True(TestProduct2.Id.Value == Order.OrdersProducts[0].ProductId.Value,$"{TestProduct.Id}, expected {Order.OrdersProducts[0].ProductId} or {Order.OrdersProducts[1].ProductId}");
            Assert.True(testProductAmount == Order.OrdersProducts[0].Amount || testProductAmount == Order.OrdersProducts[1].Amount, $"{testProductAmount}, expected {Order.OrdersProducts[0].Amount} or {Order.OrdersProducts[1].Amount}");
            Assert.True(2 == Order.OrdersProducts[0].Amount || 2 == Order.OrdersProducts[1].Amount, $"{testProductAmount2}, expected {Order.OrdersProducts[0].Amount} or {Order.OrdersProducts[1].Amount}");
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
            command.FilterBy.Add(FurnitureShop.Core.Contracts.Web.Orders.OrdersFilterFieldDTO.City, "test_city2");

            result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            Orders = dbContext.Orders.Where(o => o.City == "test_city2").ToList();
            Assert.Equal(result.Result.TotalCount, Orders.Count());
        }
        [Fact]
        public void OrderByIdTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new OrderByIdQH(dbContext);
            var command = new OrderById() { Id = TestOrder.Id };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(o => o.Id == TestOrder.Id).Include(o => o.OrdersProducts).FirstOrDefault();
            Assert.Equal(TestOrder.Street, Order.Street);
            Assert.Equal(TestOrder.City, Order.City);
            Assert.Equal(TestOrder.State, Order.State);
            Assert.Equal(TestOrder.Country, Order.Country);
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
                OrderState = OrderState.InProgress.ToString(),
            };
            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Order = dbContext.Orders.Where(c => c.Id == TestOrder.Id).FirstOrDefault();
            Assert.Equal(OrderState.InProgress, Order.OrderState);
        }
    }
}
