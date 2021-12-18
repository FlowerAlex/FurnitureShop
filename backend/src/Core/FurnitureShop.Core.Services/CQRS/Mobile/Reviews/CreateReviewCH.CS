using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class CreateReviewCH : ICommandHandler<CreateReview>
    {
        private readonly CoreDbContext dbContext;
        public CreateReviewCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateReview command)
        {
            var result = await dbContext.Reviews.AddAsync(
                new Review(command.ReviewInfo.Rating)
                {
                    Text = command.ReviewInfo.Text,
                    UserId = Id<User>.From(command.ReviewInfo.UserId),
                    ProductId = Id<Product>.From(command.ReviewInfo.ProductId)
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
