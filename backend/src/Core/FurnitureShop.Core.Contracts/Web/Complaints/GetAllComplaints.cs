using LeanCode.CQRS.Security;
using FurnitureShop.Core.Contracts.Dtos;

namespace FurnitureShop.Core.Contracts.Web.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class GetAllComplaints : PaginatedQuery<ComplaintDTO>
    { }
}
