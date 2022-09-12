using System;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Services.DataAccess;

namespace FurnitureShop.Core.Services.CQRS.Web.Complaints
{
    public class AllComplaintsQH : IQueryHandler<AllComplaints, PaginatedResult<ComplaintDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllComplaintsQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<ComplaintDTO>> ExecuteAsync(
            CoreContext context,
            AllComplaints query
        )
        {
            return await dbContext.Complaints
                .Select(
                    p =>
                        new ComplaintDTO
                        {
                            UserId = p.UserId,
                            OrderId = p.OrderId,
                            Text = p.Text,
                            Response = p.Response,
                            CreatedDate = p.CreatedDate,
                            Resolved = p.Resolved,
                            Id = p.Id,
                        }
                )
                .ToPaginatedResultAsync(query);
        }
    }
}
