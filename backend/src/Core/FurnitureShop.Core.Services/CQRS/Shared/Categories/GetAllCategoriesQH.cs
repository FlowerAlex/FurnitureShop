using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared.Categories;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Services.CQRS.Shared.Categories
{
    public class GetAllCategoriesQH : IQueryHandler<GetAllCategories, List<CategoryDTO>>
    {
        private readonly CoreDbContext dbContext;

        public GetAllCategoriesQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<List<CategoryDTO>> ExecuteAsync(CoreContext context, GetAllCategories query)
        {
            return await dbContext.Categories.Select(c => new CategoryDTO { Id = c.Id, Name = c.Name }).ToListAsync();
        }
    }
}
