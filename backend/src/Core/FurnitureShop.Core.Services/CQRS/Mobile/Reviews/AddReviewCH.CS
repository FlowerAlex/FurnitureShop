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
            RuleFor(p => p.Review.Text)
                .NotEmpty()
                .WithCode(AddReview.ErrorCodes.EmptyReviewText)
                .WithMessage("Review text should not be empty");
            RuleFor(p => p.Review.Rating)
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
                .Where(r => r.UserId == context.UserId && r.ProductId == command.Review.ProductId)
                .FirstOrDefault();

            if (oldReview != null) { }
            else
            {
                await dbContext.Reviews.AddAsync(
                    new Review
                    {
                        Text = command.Review.Text,
                        UserId = Id<User>.From(context.UserId),
                        Rating = command.Review.Rating,
                        ProductId = Id<Product>.From(command.Review.ProductId),
                    }
                );
            }

            await dbContext.SaveChangesAsync();
        }
    }
}
