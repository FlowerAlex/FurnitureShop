using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
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
            return await dbContext.Orders.Include(o => o.OrdersProducts)
                .Where(p => p.Id == query.Id)
                .Select(p => new OrderDTO
                {
                    Id = p.Id,
                    OrderInfo = new OrderInfoDTO
                    {
                        Price = p.Price,
                        UserId = p.UserId,
                        State = p.State,
                        Country = p.Country,
                        Street = p.Street,
                        City = p.City,
                        PostalCode = p.PostalCode,
                        OrderState = p.OrderState.ToString(),
                        OrderedDate = p.OrderedDate,
                        DeliveredDate = p.DeliveredDate,
                        OrderProducts = dbContext.Products
                        .Join(
                            dbContext.OrderProduct,
                            prod => prod.Id,
                            ord => ord.ProductId,
                            (prod, ord) => new OrderProductDTO
                            {
                                Amount = ord.Amount,
                                OrderId = ord.OrderId.Value,
                                Product = new ProductDTO
                                {
                                    Id = prod.Id,
                                    ProductInfo = new ProductInfoDTO
                                    {
                                        Name = prod.Name,
                                        Price = prod.Price,
                                        PreviewPhotoURL = prod.PreviewPhotoUrl,
                                        CategoryId = prod.CategoryId,
                                    }
                                }
                            }
                        ).Where(ord => ord.OrderId == p.Id).ToList(),
                    },
                })
                .FirstOrDefaultAsync();
        }
    }
}
