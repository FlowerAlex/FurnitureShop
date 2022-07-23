using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Complaints
{
    public class ComplaintByIdQH : IQueryHandler<ComplaintById, ComplaintDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ComplaintByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ComplaintDTO?> ExecuteAsync(CoreContext context, ComplaintById query)
        {
            return await dbContext.Complaints
                .Where(p => p.Id == query.Id)
                .Select(p => new ComplaintDTO
                {
                    Text = p.Text,
                    Response = p.Response,
                    UserId = p.UserId,
                    OrderId = p.OrderId,
                    Resolved = p.Resolved,
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
