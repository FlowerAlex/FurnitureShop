using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class GetAllComplaintsQH : IQueryHandler<GetAllComplaints, PaginatedResult<ComplaintDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllComplaintsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ComplaintDTO>> ExecuteAsync(CoreContext context, GetAllComplaints query)
        {
            return await dbContext.Complaints
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