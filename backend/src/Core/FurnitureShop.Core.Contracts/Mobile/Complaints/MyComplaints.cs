using FurnitureShop.Core.Contracts.Shared;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Complaints
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class MyComplaints : PaginatedQuery<ComplaintDTO> { }
}
