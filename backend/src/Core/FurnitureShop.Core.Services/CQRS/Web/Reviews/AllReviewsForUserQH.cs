using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Contracts.Web.Reviews;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Services.DataAccess;
using System.Linq;
using System.Threading.Tasks;

namespace FurnitureShop.Core.Services.CQRS.Web.Reviews
{
    public class AllReviewsForUserQH : IQueryHandler<AllReviewsForUser, PaginatedResult<ReviewDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllReviewsForUserQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ReviewDTO>> ExecuteAsync(CoreContext context, AllReviewsForUser query)
        {
            return await dbContext.Reviews
            .Where(p => p.UserId == query.UserId)
            .Select(p => new ReviewDTO
            {
                UserId = p.UserId,
                ProductId = p.ProductId,
                Text = string.IsNullOrWhiteSpace(p.Text) ? string.Empty : p.Text,
                Rating = p.Rating,
                CreatedDate = p.CreatedDate,
                Id = p.Id,
            })
            .ToPaginatedResultAsync(query);
        }
    }
}
