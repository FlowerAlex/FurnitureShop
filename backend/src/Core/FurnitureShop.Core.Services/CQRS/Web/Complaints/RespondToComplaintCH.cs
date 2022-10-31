using System;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Web.Complaints;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.CQRS.Validation.Fluent;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Complaints
{
    public class RespondToComplaintCV : ContextualValidator<RespondToComplaint>
    {
        public RespondToComplaintCV()
        {
            RuleForAsync(p => p.Id, IsComplaintResolved)
                .Equal(true)
                .WithMessage("Complaint is already resolved.")
                .WithCode(RespondToComplaint.ErrorCodes.CompaintResolved);
        }

        private static async Task<bool> IsComplaintResolved(IValidationContext ctx, Guid id)
        {
            var dbContext = ctx.GetService<CoreDbContext>();
            var compaint = await dbContext.Complaints
                .Where((c) => c.Id == id)
                .FirstOrDefaultAsync();
            if (compaint == null)
            {
                return false;
            }
            return compaint.Resolved;
        }
    }

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
