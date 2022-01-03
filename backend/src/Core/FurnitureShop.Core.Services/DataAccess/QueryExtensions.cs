using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using FurnitureShop.Core.Contracts;

namespace FurnitureShop.Core.Services.DataAccess
{
    public static class QueryExtensions
    {
        public const int MinPageSize = 1;
        public const int MaxPageSize = 200;

        public static IQueryable<TResult> Paginated<TSource, TResult>(
            this IQueryable<TResult> enumerable,
            PaginatedQuery<TSource> query)
        {
            var page = Math.Max(query.PageNumber, 0);
            var size = Math.Clamp(query.PageSize, MinPageSize, MaxPageSize);
            var skip = page * size;
            return enumerable.Skip(skip).Take(size);
        }

        public static async Task<PaginatedResult<TResult>> ToPaginatedResultAsync<TSource, TResult>(
            this IQueryable<TResult> queryable,
            PaginatedQuery<TSource> query)
        {
            return await queryable.ToPaginatedResultAsync(queryable, query);
        }

        private static async Task<PaginatedResult<TResult>> ToPaginatedResultAsync<TSource, TResult, TIntermediate>(
            this IQueryable<TResult> queryable,
            IQueryable<TIntermediate> countQuery,
            PaginatedQuery<TSource> query)
        {
            var count = await countQuery.CountAsync();
            return await queryable.ToPaginatedResultAsync(count, query);
        }

        public static async Task<PaginatedResult<TResult>> ToPaginatedResultAsync<TSource, TResult>(
            this IQueryable<TResult> queryable,
            int totalCount,
            PaginatedQuery<TSource> query)
        {
            return new()
            {
                Items = await queryable.Paginated(query).ToListAsync(),
                TotalCount = totalCount,
            };
        }

        public static IOrderedQueryable<T> OrderBy<T, TKey>(this IQueryable<T> q, Expression<Func<T, TKey>> sortBy, bool descending)
        {
            if (descending)
            {
                return q.OrderByDescending(sortBy);
            }
            else
            {
                return q.OrderBy(sortBy);
            }
        }

        public static IOrderedQueryable<T> ThenBy<T, TKey>(this IOrderedQueryable<T> q, Expression<Func<T, TKey>> sortBy, bool descending)
        {
            if (descending)
            {
                return q.ThenByDescending(sortBy);
            }
            else
            {
                return q.ThenBy(sortBy);
            }
        }

        public static IOrderedEnumerable<T> OrderBy<T, TKey>(this IEnumerable<T> q, Func<T, TKey> sortBy, bool descending)
        {
            if (descending)
            {
                return q.OrderByDescending(sortBy);
            }
            else
            {
                return q.OrderBy(sortBy);
            }
        }
    }
}
