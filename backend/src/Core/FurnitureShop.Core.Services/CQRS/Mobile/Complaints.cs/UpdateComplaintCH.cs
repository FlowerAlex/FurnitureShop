using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class UpdateComplaintCH : ICommandHandler<UpdateComplaint>
    {
        private readonly CoreDbContext dbContext;

        public UpdateComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, UpdateComplaint command)
        {
            var toUpdate = await dbContext.Complaints.Where(p => p.Id == command.Id).FirstOrDefaultAsync();
            if (toUpdate == null)
            {
                return;
            }

            toUpdate.Resolved = command.ComplaintInfo.Resolved;
            toUpdate.Response = command.ComplaintInfo.Response;
            toUpdate.Text = command.ComplaintInfo.Text;
            dbContext.Complaints.Update(toUpdate);
            await dbContext.SaveChangesAsync();
        }
    }
}
