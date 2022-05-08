using System.Threading.Tasks;
using FluentValidation;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;
using LeanCode.CQRS.Validation.Fluent;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
    public class CreateComplaintCV : ContextualValidator<CreateComplaint>
    {
        public CreateComplaintCV()
        {
            RuleFor(p => p.ComplaintInfo.Text)
                .NotEmpty()
                    .WithCode(CreateComplaint.ErrorCodes.EmptyComplaintText)
                    .WithMessage("Complaint text should not be empty");
        }
    }
    public class CreateComplaintCH : ICommandHandler<CreateComplaint>
    {
        private readonly CoreDbContext dbContext;
        public CreateComplaintCH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task ExecuteAsync(CoreContext context, CreateComplaint command)
        {
            var result = await dbContext.Complaints.AddAsync(
                new Complaint(command.ComplaintInfo.Text)
                {
                    OrderId = Id<Order>.From(command.ComplaintInfo.OrderId),
                    UserId = Id<User>.From(command.ComplaintInfo.UserId),
                    Resolved = false,
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
