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
    //TODO
    }
}
