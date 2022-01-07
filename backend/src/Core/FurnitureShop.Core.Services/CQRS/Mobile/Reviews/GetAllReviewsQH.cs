using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class GetAllReviewsQH : IQueryHandler<GetAllReviews, PaginatedResult<ReviewDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllReviewsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ReviewDTO>> ExecuteAsync(CoreContext context, GetAllReviews query)
        {
            return await dbContext.Reviews
            .Where(p => p.ProductId == query.ProductId)
            .Select(p => new ReviewDTO
            {
                ReviewInfo = new ReviewInfoDTO
                {
                    UserId = p.UserId,
                    ProductId = p.ProductId,
                    Text = string.IsNullOrWhiteSpace(p.Text) ? string.Empty : p.Text,
                    Rating = p.Rating,
                    CreatedDate = p.CreatedDate,
                },
                Id = p.Id,
            })
            .ToPaginatedResultAsync(query);
        }
    }
}
