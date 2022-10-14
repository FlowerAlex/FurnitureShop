using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class ResolveComplaintCH : ICommandHandler<ResolveComplaint>
    {
        private readonly CoreDbContext dbContext;

        public ResolveComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, ResolveComplaint command)
        {
            var toResolve = await dbContext.Complaints
                .Where(p => p.Id == command.Id)
                .FirstOrDefaultAsync();
            if (toResolve == null)
            {
                return;
            }

            toResolve.Resolved = true;
            dbContext.Complaints.Update(toResolve);
            await dbContext.SaveChangesAsync();
        }
    }
}
