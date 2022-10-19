using FurnitureShop.Core.Contracts.Web.Reviews;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Services.DataAccess;
using System.Linq;
using System.Threading.Tasks;

namespace FurnitureShop.Core.Services.CQRS.Web.Reviews
{
    public class AllReviewsForUserQH : IQueryHandler<AllReviews, PaginatedResult<ReviewDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllReviewsForUserQH(CoreDbContext dbContext)
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
                            ProductName = dbContext.Products
                                .Where(pr => pr.Id == p.ProductId)
                                .First()
                                .Name,
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
