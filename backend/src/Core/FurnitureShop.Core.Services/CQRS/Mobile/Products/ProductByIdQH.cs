using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using FurnitureShop.Core.Services.Services;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Products
{
    public class ProductByIdQH : IQueryHandler<ProductById, ProductDetailsDTO?>
    {
        private readonly CoreDbContext dbContext;

        public ProductByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<ProductDetailsDTO?> ExecuteAsync(CoreContext context, ProductById query)
        {
            var productsInShoppingCart = await context.GetProductsInShoppingCart(dbContext);
            var productsInFavourites = await context.GetProductsInFavourties(dbContext);
            return await dbContext.Products
                .Where(p => p.Id == query.Id).Include(p => p.Reviews)
                .Select(p => new ProductDetailsDTO
                {
                    Name = p.Name,
                    Price = p.Price,
                    CategoryId = p.CategoryId,
                    PreviewPhotoId = p.PreviewPhotoId,
                    AverageRating = p.Reviews.Count > 0 ? p.Reviews.Average(r => r.Rating) : null,
                    Description = p.Description,
                    ModelId = p.ModelId,
                    InFavourites = productsInFavourites.Contains(p.Id),
                    InShoppingCart = productsInShoppingCart.Contains(p.Id),
                    PhotoIds = dbContext.Photos.Where(p => p.ProductId == query.Id).Select(p => p.Id.Value).ToList(),
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
