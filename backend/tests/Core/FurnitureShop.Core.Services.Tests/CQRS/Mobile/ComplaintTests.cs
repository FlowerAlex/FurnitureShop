using System;
using System.Linq;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS.Mobile.Complaints;
using FurnitureShop.Core.Services.CQRS.Web.Complaints;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class ComplaintTests : IDisposable
    {
        private readonly Order TestOrder = new Order("test_address")
        {
            UserId = Id<User>.From(TestUserId),
        };
        private readonly Complaint TestComplaint = new Complaint("test_Complaint")
        {
            Resolved = true,
            Response = "test response",
            CreatedDate = DateTime.Parse("09-09-1999")
        };
        private static Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");

        private string NewComplaintText = "new Complaint";
        private string NewComplaintResponse = "new response";
        private bool NewComplaintResolved = false;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }

        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Orders.Add(TestOrder);
            context.SaveChanges();

            TestComplaint.OrderId = context.Orders
                .Where(c => c.UserId == TestUserId)
                .FirstOrDefault()
                .Id;
            context.Complaints.Add(TestComplaint);
            context.SaveChanges();
        }

        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public ComplaintTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                .UseInMemoryDatabase(Guid.NewGuid().ToString())
                .Options;
            Seed();
        }

        [Fact]
        public void ComplaintByIdQHTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new ComplaintByIdQH(dbContext);
            var command = new ComplaintById { Id = TestComplaint.Id };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Complaint = result.Result;
            Assert.NotNull(Complaint);
            Assert.Equal(TestComplaint.Text, Complaint.Text);
            Assert.Equal(TestComplaint.Response, Complaint.Response);
            Assert.Equal(TestComplaint.Resolved, Complaint.Resolved);
            Assert.Equal(TestComplaint.OrderId, Complaint.OrderId);
            Assert.Equal(TestComplaint.UserId, Complaint.UserId);
            Assert.Equal(TestComplaint.Id, Complaint.Id);
        }

        [Fact]
        public void CreateComplaintTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateComplaintCH(dbContext);
            var command = new CreateComplaint
            {
                ComplaintInfo = new FurnitureShop.Core.Contracts.Mobile.Complaints.ComplaintDTOBase
                {
                    Text = NewComplaintText,
                    OrderId = TestOrder.Id
                }
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Complaint = dbContext.Complaints
                .Where(c => c.Text == NewComplaintText)
                .FirstOrDefault();
            Assert.NotNull(Complaint);
            Assert.Equal(NewComplaintText, Complaint.Text);
            Assert.Equal(NewComplaintResolved, Complaint.Resolved);
            Assert.Equal(TestOrder.Id, Complaint.OrderId);
        }

        [Fact]
        public void DeleteComplaintTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new DeleteComplaintCH(dbContext);
            var command = new DeleteComplaint { Id = TestComplaint.Id };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Complaint = dbContext.Complaints.Find(TestComplaint.Id);
            Assert.Null(Complaint);
        }

        [Fact]
        public void UpdateComplaintTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new UpdateComplaintCH(dbContext);
            var command = new UpdateComplaint
            {
                UpdatedComplaint =
                    new FurnitureShop.Core.Contracts.Mobile.Complaints.UpdateComplaintDTO
                    {
                        Text = NewComplaintText,
                        Id = TestComplaint.Id
                    }
            };

            var result = handler.ExecuteAsync(coreContext, command);

            Assert.True(result.IsCompletedSuccessfully);
            var Complaint = dbContext.Complaints
                .Where(c => c.Text == NewComplaintText)
                .FirstOrDefault();
            Assert.NotNull(Complaint);
            Assert.Equal(NewComplaintText, Complaint.Text);
            Assert.Equal(TestOrder.Id, Complaint.OrderId);
        }

        [Fact]
        public void RespondToComplaintTest() 
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new RespondToComplaintCH(dbContext);
            var command = new RespondToComplaint()
            {
                Response = "abcd",
                Id = TestComplaint.Id,
            };

            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            Assert.Equal("abcd", dbContext.Complaints.Where(c => c.Id == TestComplaint.Id).FirstOrDefault()?.Response);

        }
        [Fact]
        public void ResolveComplaintTest() 
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new ResolveComplaintCH(dbContext);
            var command = new ResolveComplaint()
            {
                Id = TestComplaint.Id
            };

            var result = handler.ExecuteAsync(coreContext, command);
            Assert.True(result.IsCompletedSuccessfully);
            Assert.True(dbContext.Complaints.Where(c => c.Id == TestComplaint.Id).FirstOrDefault()?.Resolved);
        }
    }
}
