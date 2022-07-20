using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class UpdateReviewCV : ContextualValidator<UpdateReview>
    {
        public UpdateReviewCV()
        {
            RuleFor(p => p.UpdatedReview.Text)
                .NotEmpty()
                    .WithCode(UpdateReview.ErrorCodes.EmptyReviewText)
                    .WithMessage("Review text should not be empty");
            RuleFor(p => p.UpdatedReview.Rating)
                .InclusiveBetween(0.0, 5.0)
                    .WithCode(UpdateReview.ErrorCodes.IncorrectRating)
                    .WithMessage("Incorrect rating");
        }
    }
    public class UpdateReviewCH : ICommandHandler<UpdateReview>
    {
        private readonly CoreDbContext dbContext;

        public UpdateReviewCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateReview command)
        {
            var toUpdate = await dbContext.Reviews.Where(p => p.Id == command.UpdatedReview.Id).FirstOrDefaultAsync();
            if (toUpdate == null)
            {
                return;
            }

            toUpdate.Rating = command.UpdatedReview.Rating;
            toUpdate.Text = command.UpdatedReview.Text;
            dbContext.Reviews.Update(toUpdate);
            await dbContext.SaveChangesAsync();
        }
    }
}
