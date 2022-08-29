using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
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
            var shoppingCart = dbContext.ShoppingCarts.Where(sh => sh.UserId == context.UserId).FirstOrDefault();
            var shoppingCartExists = shoppingCart != null;
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
                    InFavourites = dbContext.Favourites
                            .Where(f => f.UserId == context.UserId && f.ProductId == query.Id).Any(),
                    InShoppingCart = shoppingCartExists ? dbContext.ShoppingCartProduct
                        .Where(shp => shp.Id == shoppingCart!.Id.Value && shp.ProductId == p.Id).Any() : false,
                    PhotosIds = dbContext.Photos.Where(p => p.ProductId == query.Id).Select(p => p.Id.Value).ToList(),
                    Id = p.Id,
                })
                .FirstOrDefaultAsync();
        }
    }
}
