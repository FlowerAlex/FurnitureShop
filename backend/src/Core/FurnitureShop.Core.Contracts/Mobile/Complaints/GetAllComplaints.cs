using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.Admin)]
    public class GetAllComplaints : PaginatedQuery<ComplaintDTO>
    { }
}
