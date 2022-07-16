using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
using FurnitureShop.Core.Contracts.Shared.Reviews;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Shared.Reviews
{
    public class ReviewByIdQH : IQueryHandler<ReviewById, ReviewDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ReviewByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ReviewDTO?> ExecuteAsync(CoreContext context, ReviewById query)
        {
            return await dbContext.Reviews
                .Where(p => p.Id == query.Id)
                .Select(p => new ReviewDTO
                {
                    ReviewInfo = new ReviewInfoDTO
                    {
                        Text = p.Text == null ? "" : p.Text,
                        Rating = p.Rating,
                        UserId = p.UserId,
                        ProductId = p.ProductId,
                        CreatedDate = p.CreatedDate,
                    },
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
