using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class CreateReviewCV : ContextualValidator<CreateReview>
    {
        public CreateReviewCV()
        {
            RuleFor(p => p.ReviewInfo.Text)
                .NotEmpty()
                    .WithCode(CreateReview.ErrorCodes.EmptyReviewText)
                    .WithMessage("Review text should not be empty");
            RuleFor(p => p.ReviewInfo.Rating)
                .InclusiveBetween(0.0,5.0)
                    .WithCode(CreateReview.ErrorCodes.IncorrectRating)
                    .WithMessage("Incorrect rating");
        }
    }
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
                    ProductId = Id<Product>.From(command.ReviewInfo.ProductId),
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
