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
    public class DeleteComplaintCH : ICommandHandler<DeleteComplaint>
    {
        private readonly CoreDbContext dbContext;

        public DeleteComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, DeleteComplaint command)
        {
            var toDelete = await dbContext.Complaints.Where(p => p.Id == command.Id).FirstOrDefaultAsync();
            if (toDelete == null)
            {
                return;
            }
            dbContext.Complaints.Remove(toDelete);
            await dbContext.SaveChangesAsync();
        }
    }
}
