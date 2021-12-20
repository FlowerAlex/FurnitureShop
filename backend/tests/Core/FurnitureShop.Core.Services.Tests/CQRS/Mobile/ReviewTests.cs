using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.CQRS;
using FurnitureShop.Core.Services.CQRS.Mobile.Reviews;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;
using Xunit;

namespace FurnitureShop.Core.Services.Tests.CQRS.Mobile
{
    public class ReviewTests : IDisposable
    {
        private readonly Review TestReview = new Review(4.5)
        {
            Text = "good test product",
            CreatedDate = DateTime.Parse("09-09-2020"),
            UserId = Id<User>.From(Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19")),
        };
        private readonly Product TestProduct = new Product("test_Product", "Product_for_test", 100);
        private readonly Guid TestUserId = Guid.Parse("5d60120d-8a32-47f1-8b81-4018eb230b19");
        
        private string NewReviewText = "new Review";
        private Guid NewReviewProductId = Guid.Parse("a063c7ce-b477-4d27-ac16-c771b9fef4e0");
        private double NewReviewRating = 3;
        private readonly string TestUserRole = Auth.Roles.User;
        private readonly string TestAdminRole = Auth.Roles.Admin;
        private DbContextOptions<CoreDbContext> ContextOptions { get; }
        private void Seed()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Products.Add(TestProduct);
            context.SaveChanges();
            TestReview.ProductId = context.Products.
                Where(c => c.Name == TestProduct.Name).FirstOrDefault().Id;   
            context.Reviews.Add(TestReview);
            context.SaveChanges();
        }
        public void Dispose()
        {
            using var context = new CoreDbContext(ContextOptions);
            context.Database.EnsureDeleted();
        }

        public ReviewTests()
        {
            ContextOptions = new DbContextOptionsBuilder<CoreDbContext>()
                    .UseInMemoryDatabase(Guid.NewGuid().ToString())
                    .Options;
            Seed();
        }

        [Fact]
        public void ReviewByIdQHTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestUserRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new ReviewByIdQH(dbContext);
            var command = new ReviewById { Id = TestReview.Id };
            
            var result = handler.ExecuteAsync(coreContext, command);
            
            Assert.True(result.IsCompletedSuccessfully);
            var Review = result.Result;
            Assert.NotNull(Review);
            Assert.Equal(TestReview.Text, Review.ReviewInfo.Text);
            Assert.Equal(TestReview.Rating, Review.ReviewInfo.Rating);
            Assert.Equal(TestReview.ProductId, Review.ReviewInfo.ProductId  );
            Assert.Equal(TestReview.CreatedDate, Review.ReviewInfo.CreatedDate  );
            Assert.Equal(TestReview.Id, Review.Id);
        }
        [Fact]
        public void CreateReviewTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new CreateReviewCH(dbContext);
            var command = new CreateReview {
                ReviewInfo = new ReviewInfoDTO
                {
                    Text = NewReviewText,
                    ProductId = NewReviewProductId,
                    UserId = TestUserId,
                    Rating = NewReviewRating,
                }
            };
            
            var result = handler.ExecuteAsync(coreContext, command);
            
            Assert.True(result.IsCompletedSuccessfully);
            var Review = dbContext.Reviews.Where(c => c.Text == NewReviewText).FirstOrDefault();
            Assert.NotNull(Review);
            Assert.Equal(NewReviewRating, Review.Rating);
            Assert.Equal(NewReviewText, Review.Text);
            Assert.Equal(NewReviewProductId,Review.ProductId.Value);
        }
        [Fact]
        public void DeleteReviewTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new DeleteReviewCH(dbContext);
            var command = new DeleteReview{Id = TestReview.Id};
            
            var result = handler.ExecuteAsync(coreContext,command);
            
            Assert.True(result.IsCompletedSuccessfully);
            var Review = dbContext.Reviews.Find(TestReview.Id);
            Assert.Null(Review);
        }
        [Fact]
        public void UpdateReviewTest()
        {
            var coreContext = CoreContext.ForTests(TestUserId, TestAdminRole);
            using var dbContext = new CoreDbContext(ContextOptions);
            var handler = new UpdateReviewCH(dbContext);
            var command = new UpdateReview{
                ReviewInfo = new ReviewInfoDTO
                {
                    Text = NewReviewText,
                    UserId = TestUserId,
                    Rating = NewReviewRating,
                },Id = TestReview.Id};
            
            var result = handler.ExecuteAsync(coreContext,command);
            
            Assert.True(result.IsCompletedSuccessfully);
            var Review = dbContext.Reviews.Where(c => c.Id == TestReview.Id).FirstOrDefault();
            Assert.NotNull(Review);
            Assert.Equal(NewReviewText, Review.Text);
            Assert.Equal(NewReviewRating, Review.Rating);
            Assert.Equal(TestReview.Id, Review.Id);
        }
    }
}
