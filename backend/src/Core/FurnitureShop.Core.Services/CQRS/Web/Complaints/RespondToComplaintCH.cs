using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Complaints
{
    public class RespondToComplaintCH : ICommandHandler<RespondToComplaint>
    {
        private readonly CoreDbContext dbContext;

        public RespondToComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, RespondToComplaint command)
        {
            var toRespond = await dbContext.Complaints
                .Where(p => p.Id == command.Id)
                .FirstOrDefaultAsync();
            if (toRespond == null)
            {
                return;
            }

            toRespond.Response = command.Response;
            dbContext.Complaints.Update(toRespond);
            await dbContext.SaveChangesAsync();
        }
    }
}
