using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
using FurnitureShop.Core.Contracts.Web.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Products
{
    public class ProductByIdQH : IQueryHandler<ProductById, ProductWithDetailsDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ProductByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ProductWithDetailsDTO?> ExecuteAsync(CoreContext context, ProductById query)
        {
            var shoppingCart = dbContext.ShoppingCarts.Where(sh => sh.UserId == context.UserId).FirstOrDefault();
            var shoppingCartExists = shoppingCart != null;
            shoppingCartExists = false;
            return await dbContext.Products
                .Where(p => p.Id == query.Id).Include(p => p.Reviews)
                .Select(p => new ProductWithDetailsDTO
                {
                        Name = p.Name,
                        Price = p.Price,
                        CategoryId = p.CategoryId,
                        PreviewPhotoURL = p.PreviewPhotoUrl,
                        AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                        Description = p.Description,
                        ModelUrl = p.ModelUrl,                  
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
