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
    public class DeleteReviewCH : ICommandHandler<DeleteReview>
    {
        private readonly CoreDbContext dbContext;

        public DeleteReviewCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, DeleteReview command)
        {
            var toDelete = await dbContext.Reviews
                .Where(p => p.Id == command.Id)
                .FirstOrDefaultAsync();
            if (toDelete == null)
            {
                return;
            }

            dbContext.Reviews.Remove(toDelete);
            await dbContext.SaveChangesAsync();
        }
    }
}
