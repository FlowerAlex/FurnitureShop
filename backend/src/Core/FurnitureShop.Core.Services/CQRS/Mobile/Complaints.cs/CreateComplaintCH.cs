using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Complaints;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using LeanCode.DomainModels.Model;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Complaints
{
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
                new Complaint(command.ComplaintInfoDTO.Text)
                {
                    OrderId = Id<Order>.From(command.ComplaintInfoDTO.OrderId),
                    UserId = Id<User>.From(command.ComplaintInfoDTO.UserId),
                    Resolved = false,
                });
            await dbContext.SaveChangesAsync();
        }
    }
}
