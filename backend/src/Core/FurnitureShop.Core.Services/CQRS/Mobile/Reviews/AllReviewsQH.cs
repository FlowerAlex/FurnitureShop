using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class AllReviewsQH : IQueryHandler<AllReviews, AllReviewsDTO>
    {
        private readonly CoreDbContext dbContext;

        public AllReviewsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<AllReviewsDTO> ExecuteAsync(CoreContext context, AllReviews query)
        {
            var reviews = await dbContext.Reviews
                .Where(p => p.ProductId == query.ProductId && p.UserId != context.UserId)
                .Select(
                    p =>
                        new ReviewDTO
                        {
                            UserId = p.UserId,
                            UserName = dbContext.Users
                                .Where(u => u.Id == p.UserId)
                                .First()
                                .Username,
                            ProductId = p.ProductId,
                            Text = string.IsNullOrWhiteSpace(p.Text) ? string.Empty : p.Text,
                            Rating = p.Rating,
                            CreatedDate = p.CreatedDate,
                            Id = p.Id,
                        }
                )
                .ToListAsync();
            var userReview = await dbContext.Reviews
                .Where(p => p.ProductId == query.ProductId && p.UserId == context.UserId)
                .Select(
                    p =>
                        new ReviewDataDTO
                        {
                            ProductId = p.ProductId,
                            Text = string.IsNullOrWhiteSpace(p.Text) ? string.Empty : p.Text,
                            Rating = p.Rating,
                            CreatedDate = p.CreatedDate,
                        }
                )
                .FirstAsync();

            return new AllReviewsDTO()
            {
                Items = reviews,
                TotalCount = reviews.Count,
                MyReviewData = userReview,
            };
        }
    }
}
