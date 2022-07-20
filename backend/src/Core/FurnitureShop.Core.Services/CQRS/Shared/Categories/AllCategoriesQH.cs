using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
namespace FurnitureShop.Core.Services.CQRS.Shared.Categories
{
    public class AllCategoriesQH : IQueryHandler<AllCategories, List<CategoryDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllCategoriesQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<List<CategoryDTO>> ExecuteAsync(CoreContext context, AllCategories query)
        {
            return await dbContext.Categories.Select(c => new CategoryDTO { Id = c.Id, Name = c.Name }).ToListAsync();
        }
    }
}
