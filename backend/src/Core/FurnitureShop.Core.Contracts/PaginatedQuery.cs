using System.Collections.Generic;
using LeanCode.CQRS;

namespace FurnitureShop.Core.Contracts
{
    public abstract class PaginatedQuery<TResult> : IRemoteQuery<PaginatedResult<TResult>>
    {
        public int PageNumber { get; set; }
        public int PageSize { get; set; }
    }

    public abstract class SortablePaginatedQuery<TResult, TBy> : PaginatedQuery<TResult>
    {
        public string? FilterBy { get; set; }

        public TBy SortBy { get; set; }
        public bool SortByDescending { get; set; }
    }
    public abstract class SortableMulitiFilterPaginatedQuery<TResult, TBy, TFBy> : PaginatedQuery<TResult>
    {
        public Dictionary<TFBy,string> FilterBy { get; set; }

        public TBy SortBy { get; set; }
        public bool SortByDescending { get; set; }
    }
    
    public class PaginatedResult<TResult>
    {
        public List<TResult> Items { get; set; }
        public long TotalCount { get; set; }
    }
}
