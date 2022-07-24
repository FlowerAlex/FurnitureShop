using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FurnitureShop.Core.Contracts.Shared;
using FurnitureShop.Core.Contracts.Web.Orders;
using FurnitureShop.Core.Domain;
using FurnitureShop.Core.Services.DataAccess;
using Microsoft.EntityFrameworkCore;

namespace FurnitureShop.Core.Services.CQRS.Web.Orders
{
    public class AllOrdersQH : IQueryHandler<AllOrders, PaginatedResult<OrderDTO>>
    {
        private readonly CoreDbContext dbContext;

        public AllOrdersQH(CoreDbContext dbContext)
        {
            this.dbContext = dbContext;
        }

        public async Task<PaginatedResult<OrderDTO>> ExecuteAsync(CoreContext context, AllOrders query)
        {
            return await dbContext.Orders.Include(o => o.OrdersProducts)
                .FilterBy(query)
                .Select(p => new OrderDTO
                {
                    Id = p.Id,

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
                                Product = new FurnitureShop.Core.Contracts.Web.Products.ProductDTO
                                {
                                    Id = prod.Id,
                                    Name = prod.Name,
                                    Price = prod.Price,
                                    PreviewPhotoURL = prod.PreviewPhotoUrl,
                                    CategoryId = prod.CategoryId,
                                }
                            }
                        ).Where(ord => ord.OrderId == p.Id).ToList(),

                })
                .SortBy(query)
                .ToPaginatedResultAsync(query);
        }
    }
    internal static class OrderQHExtensions
    {
        public static IQueryable<Order> FilterBy(this IQueryable<Order> queryable, AllOrders query)
        {
            foreach (var filter in query.FilterBy)
            {
                switch (filter.Key)
                {
                    case OrdersFilterFieldDTO.Country:
                        queryable = queryable.Where(c => c.Country.ToLower().Contains(filter.Value.ToLowerInvariant()));
                        break;
                    case OrdersFilterFieldDTO.State:
                        queryable = queryable.Where(c => c.State.ToLower().Contains(filter.Value.ToLowerInvariant()));
                        break;
                    case OrdersFilterFieldDTO.City:
                        queryable = queryable.Where(c => c.City.ToLower().Contains(filter.Value.ToLowerInvariant()));
                        break;
                    case OrdersFilterFieldDTO.Street:
                        queryable = queryable.Where(c => c.Street.ToLower().Contains(filter.Value.ToLowerInvariant()));
                        break;
                    case OrdersFilterFieldDTO.OrderState:
                        queryable = queryable.Where(c => c.OrderState.ToString().ToLower() == filter.Value.ToLowerInvariant());
                        break;
                    case OrdersFilterFieldDTO.PostalCode:
                        queryable = queryable.Where(c => c.PostalCode == filter.Value);
                        break;
                    case OrdersFilterFieldDTO.UserId:
                        queryable = queryable.Where(c => c.UserId.ToString() == filter.Value);
                        break;
                    default:
                        break;
                }
            }
            return queryable;
        }

        public static IQueryable<OrderDTO> SortBy(this IQueryable<OrderDTO> queryable, AllOrders query)
        {
            if (!query.SortBy.HasValue)
            {
                return queryable;
            }

            return query.SortBy switch
            {
                OrdersSortFieldDTO.OrderedDate => queryable.OrderBy(s => s.OrderedDate, query.SortByDescending).ThenBy(s => s.Id),
                OrdersSortFieldDTO.DeliveredDate => queryable.OrderBy(s => s.DeliveredDate, query.SortByDescending).ThenBy(s => s.Id),
                _ => queryable
            };
        }
    }
}
