using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class AllReviewsQH : IQueryHandler<AllReviews, PaginatedResult<ReviewDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllReviewsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ReviewDTO>> ExecuteAsync(
            CoreContext context,
            AllReviews query
        )
        {
            return await dbContext.Reviews
                .Where(p => p.ProductId == query.ProductId)
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
                .ToPaginatedResultAsync(query);
        }
    }
}
