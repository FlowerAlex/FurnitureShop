using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class OrderByIdQH : IQueryHandler<OrderById, OrderDTO?>
    {
        private readonly CoreDbContext dbContext;

        public OrderByIdQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<OrderDTO?> ExecuteAsync(CoreContext context, OrderById query)
        {
            return await dbContext.Orders.Include(o => o.Products)
                .Where(p => p.Id == query.OrderId)
                .Select(p => new OrderDTO
                {
                    Id = p.Id,
                    OrderInfo = new OrderInfoDTO
                    {
                        Price = p.Price,
                        UserId = p.UserId,
                        // dopisac adres
                        OrderedDate = p.OrderedDate,
                        DeliveredDate = p.DeliveredDate,
                        Products = p.Products.Select(p => new ProductDTO
                        {
                            Id = p.Id,
                            ProductInfo = new ProductInfoDTO
                            {
                                Name = p.Name,
                                Description = p.Description,
                                Price = p.Price,
                                ModelUrl = p.ModelUrl,
                            },
                        }).ToList(),
                    },
                })
                .FirstOrDefaultAsync();
        }
    }
}
