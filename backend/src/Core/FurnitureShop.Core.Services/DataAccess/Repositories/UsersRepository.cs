using System.Threading;
using System.Threading.Tasks;
using FurnitureShop.Core.Domain;
using LeanCode.DomainModels.EF;
using LeanCode.DomainModels.Model;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.DataAccess.Repositories
{
    public class UsersRepository : EFRepository<User, CoreDbContext>
    {
        public UsersRepository(CoreDbContext dbContext) : base(dbContext) { }

        public override Task<User?> FindAsync(
            Id<User> id,
            CancellationToken cancellationToken = default
        )
        {
            return DbSet.AsTracking().FirstOrDefaultAsync(u => u.Id == id, cancellationToken)!;
        }
    }
}
