using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;
using System.Linq;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class AddReviewCV : ContextualValidator<AddReview>
    {
        public AddReviewCV()
        {
            RuleFor(p => p.ReviewData.Text)
                .NotEmpty()
                .WithCode(AddReview.ErrorCodes.EmptyReviewText)
                .WithMessage("Review text should not be empty");
            RuleFor(p => p.ReviewData.Rating)
                .InclusiveBetween(0.0, 5.0)
                .WithCode(AddReview.ErrorCodes.IncorrectRating)
                .WithMessage("Incorrect rating");
        }
    }

    public class AddReviewCH : ICommandHandler<AddReview>
    {
        private readonly CoreDbContext dbContext;

        public AddReviewCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, AddReview command)
        {
            var oldReview = dbContext.Reviews
                .Where(
                    r => r.UserId == context.UserId && r.ProductId == command.ReviewData.ProductId
                )
                .FirstOrDefault();

            if (oldReview != null)
            {
                oldReview.Text = command.ReviewData.Text;
                oldReview.Rating = command.ReviewData.Rating;
            }
            else
            {
                await dbContext.Reviews.AddAsync(
                    new Review
                    {
                        Text = command.ReviewData.Text,
                        UserId = Id<User>.From(context.UserId),
                        Rating = command.ReviewData.Rating,
                        ProductId = Id<Product>.From(command.ReviewData.ProductId),
                    }
                );
            }

            await dbContext.SaveChangesAsync();
        }
    }
}
