using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Mobile.Products;
using FurnitureShop.Core.Contracts.Mobile.Orders;
using FurnitureShop.Core.Contracts.Shared.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;
using FurnitureShop.Core.Contracts.Shared;

namespace FurnitureShop.Core.Services.CQRS.Mobile.Orders
{
    public class MyOrdersQH : IQueryHandler<MyOrders, PaginatedResult<OrderDTO>>
    {
        private readonly CoreDbContext dbContext;

        public MyOrdersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<OrderDTO>> ExecuteAsync(
            CoreContext context,
            MyOrders query
        )
        {
            return await dbContext.Orders
                .Include(o => o.OrdersProducts)
                .Where(o => o.UserId == context.UserId)
                .FilterBy(query)
                .Select(
                    p =>
                        new OrderDTO
                        {
                            Id = p.Id,
                            Price = p.Price,
                            UserId = p.UserId,
                            Address = p.Address,
                            OrderState = Enum.Parse<OrderStateDTO>(p.OrderState.ToString()),
                            OrderedDate = p.OrderedDate,
                            DeliveredDate = p.DeliveredDate,
                            Products = dbContext.OrderProduct
                                .Where(o => o.OrderId == p.Id)
                                .Join(
                                    dbContext.Products,
                                    ord => ord.ProductId,
                                    prod => prod.Id,
                                    (ord, prod) =>
                                        new ProductInOrderDTO
                                        {
                                            Amount = ord.Amount,
                                            Id = prod.Id,
                                            Name = prod.Name,
                                            Price = prod.Price,
                                            Description = prod.Description,
                                            PreviewPhotoId = prod.PreviewPhotoId,
                                            CategoryId = prod.CategoryId,
                                        }
                                )
                                .ToList(),
                        }
                )
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
                        queryable = queryable.Where(
                            c =>
                                c.OrderState.ToString().ToLower() == filter.Value.ToLowerInvariant()
                        );
                        break;
                    default:
                        break;
                }
            }
            return queryable;
        }

        public static IQueryable<OrderDTO> SortBy(
            this IQueryable<OrderDTO> queryable,
            MyOrders query
        )
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                MyOrdersSortFieldDTO.OrderedDate
                    => queryable
                        .OrderBy(s => s.OrderedDate, query.SortByDescending)
                        .ThenBy(s => s.Id),
                MyOrdersSortFieldDTO.DeliveredDate
                    => queryable
                        .OrderBy(s => s.DeliveredDate, query.SortByDescending)
                        .ThenBy(s => s.Id),
                _ => queryable,
            };
        }
    }
}
