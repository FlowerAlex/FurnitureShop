using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS;
using FurnitureShop.Core.Services.CQRS.Mobile.Orders;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class OrderTests : IDisposable
    {
        private readonly Category TestCategory = new Category("test_category");
        private readonly Order TestOrder = new Order("test_street", "test_city",
            "test_state", "test_postal_code", "test_country")
        {
            UserId = Id<User>.From(TestUserId),
        };
        private static readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        
        private string NewOrderName = "new Order";
        private string NewProdctDescription = "new desc";
        private string NewOrderModelUrl = "new model url";
        private decimal NewOrderPrice = 111;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Categories.Add(TestCategory);
            context.SaveChanges();

            //TestOrder.CategoryId = context.Categories.Where(c => c.Name == TestCategory.Name).FirstOrDefault().Id;
            context.Orders.Add(TestOrder);
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

        // [Fact]
        // public void OrderByIdQHTest()
        // {
        //     var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
        //     using var dbContext = new CoreDbContext(ContextOptions);
        //     var handler = new OrderByIdQH(dbContext);
        //     var command = new OrderById { Id = TestOrder.Id };
        //     var result = handler.ExecuteAsync(coreContext, command);
        //     Assert.True(result.IsCompletedSuccessfully);
        //     var Order = result.Result;
        //     Assert.NotNull(Order);
        //     Assert.Equal(TestOrder.Name, Order.OrderInfo.Name);
        //     Assert.Equal(TestOrder.Description, Order.OrderInfo.Description);
        //     Assert.Equal(TestOrder.ModelUrl, Order.OrderInfo.ModelUrl);
        //     Assert.Equal(TestOrder.Price, Order.OrderInfo.Price);
        //     Assert.Equal(TestOrder.CategoryId, Order.OrderInfo.CategoryId);
        //     Assert.Equal(TestOrder.Id, Order.Id);
        // }
        // [Fact]
        // public void CreateOrderTest()
        // {
        //     var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
        //     using var dbContext = new CoreDbContext(ContextOptions);
        //     var handler = new CreateOrderCH(dbContext);
        //     var command = new CreateOrder
        //     {
        //         OrderInfoDTO = new OrderInfoDTO
        //         {
        //             Name = NewOrderName,
        //             Description = NewProdctDescription,
        //             ModelUrl = NewOrderModelUrl,
        //             Price = NewOrderPrice,
        //         }
        //     };
        //     var result = handler.ExecuteAsync(coreContext, command);
        //     Assert.True(result.IsCompletedSuccessfully);
        //     var Order = dbContext.Orders.Where(c => c.Name == NewOrderName).FirstOrDefault();
        //     Assert.NotNull(Order);
        //     Assert.Equal(NewOrderName, Order.Name);
        //     Assert.Equal(NewProdctDescription, Order.Description);
        //     Assert.Equal(NewOrderModelUrl, Order.ModelUrl);
        //     Assert.Equal(NewOrderPrice, Order.Price);
        //     Assert.Null(Order.CategoryId);
        // }
        // [Fact]
        // public void DeleteOrderTest()
        // {
        //     var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
        //     using var dbContext = new CoreDbContext(ContextOptions);
        //     var handler = new DeleteOrderCH(dbContext);
        //     var command = new DeleteOrder { Id = TestOrder.Id };
        //     var result = handler.ExecuteAsync(coreContext, command);
        //     Assert.True(result.IsCompletedSuccessfully);
        //     var Order = dbContext.Orders.Find(TestOrder.Id);
        //     Assert.Null(Order);
        // }
        // [Fact]
        // public void UpdateOrderTest()
        // {
        //     var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
        //     using var dbContext = new CoreDbContext(ContextOptions);
        //     var handler = new UpdateOrderCH(dbContext);
        //     var command = new UpdateOrder
        //     {
        //         Id = TestOrder.Id,
        //         OrderInfoDTO = new OrderInfoDTO
        //         {
        //             Name = NewOrderName,
        //             Description = NewProdctDescription,
        //             ModelUrl = NewOrderModelUrl,
        //             Price = NewOrderPrice,
        //         }
        //     };
        //     var result = handler.ExecuteAsync(coreContext, command);
        //     Assert.True(result.IsCompletedSuccessfully);
        //     var Order = dbContext.Orders.Where(c => c.Name == NewOrderName).FirstOrDefault();
        //     Assert.NotNull(Order);
        //     Assert.Equal(NewOrderName, Order.Name);
        //     Assert.Equal(NewProdctDescription, Order.Description);
        //     Assert.Equal(NewOrderModelUrl, Order.ModelUrl);
        //     Assert.Equal(NewOrderPrice, Order.Price);
        //     Assert.Null(Order.CategoryId);
        // }
    }
}
