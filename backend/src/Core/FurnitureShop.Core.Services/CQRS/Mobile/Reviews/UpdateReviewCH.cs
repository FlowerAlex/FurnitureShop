using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Reviews
{
    public class UpdateReviewCH : ICommandHandler<UpdateReview>
    {
        private readonly CoreDbContext dbContext;

        public UpdateReviewCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateReview command)
        {
            var toUpdate =  await dbContext.Reviews.Where(p => p.Id == command.Id).FirstOrDefaultAsync();
            if (toUpdate == null) 
            {
                return;
            }
            toUpdate.Rating = command.ReviewInfo.Rating;
            toUpdate.Text = command.ReviewInfo.Text;
            dbContext.Reviews.Update(toUpdate);
            await dbContext.SaveChangesAsync();
        }
    }
}
