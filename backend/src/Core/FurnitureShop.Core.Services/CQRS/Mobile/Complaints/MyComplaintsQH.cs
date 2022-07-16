using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class MyComplaintsQH : IQueryHandler<MyComplaints, PaginatedResult<ComplaintDTO>>
    {
        private readonly CoreDbContext dbContext;

        public MyComplaintsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ComplaintDTO>> ExecuteAsync(CoreContext context, MyComplaints query)
        {
            return await dbContext.Complaints.Where(c => c.UserId == context.UserId)
            .Select(p => new ComplaintDTO
            {
                ComplaintInfo = new ComplaintInfoDTO
                {
                    UserId = p.UserId,
                    OrderId = p.OrderId,
                    Text = p.Text,
                    Response = p.Response,
                    CreatedDate = p.CreatedDate,
                    Resolved = p.Resolved,
                },
                Id = p.Id,
            })
            .ToPaginatedResultAsync(query);
        }
    }
}
