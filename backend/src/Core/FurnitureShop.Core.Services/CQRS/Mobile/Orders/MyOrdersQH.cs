using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Dtos;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class MyOrdersQH : IQueryHandler<MyOrders, PaginatedResult<OrderDTO>>
    {
        private readonly CoreDbContext dbContext;

        public MyOrdersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<OrderDTO>> ExecuteAsync(CoreContext context, MyOrders query)
        {
            return await dbContext.Orders.Include(o => o.OrdersProducts)
                .Where(o => o.UserId == context.UserId)
                .FilterBy(query)
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
                                    Name = prod.Name,
                                    Price = prod.Price,
                                    PreviewPhotoURL = prod.PreviewPhotoUrl,
                                    CategoryId = prod.CategoryId,
                                }
                            }
                        ).Where(ord => ord.OrderId == p.Id).ToList(),
                    },
                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }
    internal static class MyOrderQHExtensions
    {
        public static IQueryable<Order> FilterBy(this IQueryable<Order> queryable, MyOrders query)
        {
            foreach (var filter in query.FilterBy)
            {
                switch (filter.Key)
                {
                    case MyOrdersFilterFieldDTO.OrderState:
                        queryable = queryable.Where(c => c.OrderState.ToString().ToLower() == filter.Value.ToLowerInvariant());
                        break;
                    default:
                        break;
                }
            }
            return queryable;
        }

        public static IQueryable<OrderDTO> SortBy(this IQueryable<OrderDTO> queryable, MyOrders query)
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                MyOrdersSortFieldDTO.OrderedDate => queryable.OrderBy(s => s.OrderInfo.OrderedDate, query.SortByDescending).ThenBy(s => s.Id),
                MyOrdersSortFieldDTO.DeliveredDate => queryable.OrderBy(s => s.OrderInfo.DeliveredDate, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable
            };
        }
    }
}
