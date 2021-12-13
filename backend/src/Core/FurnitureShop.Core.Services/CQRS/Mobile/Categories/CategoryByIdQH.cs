using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Categories
{
    public class CategoryByIdQH : IQueryHandler<CategoryById, CategoryDTO?>
    {
        private readonly CoreDbContext dbContext;

        public CategoryByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<CategoryDTO?> ExecuteAsync(CoreContext context, CategoryById query)
        {
            return await dbContext.Categories
                .Where(p => p.Id == query.Id)
                .Select(p => new CategoryDTO
                {
                    Id = p.Id,
                    Name = p.Name,
                })
                .FirstOrDefaultAsync();
        }
    }
}
