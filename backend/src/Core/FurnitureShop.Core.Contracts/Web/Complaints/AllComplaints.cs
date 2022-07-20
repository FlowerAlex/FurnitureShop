using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Web.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class AllComplaints : PaginatedQuery<ComplaintDTO>
    { }
}
