using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;


namespace FurnitureShop.Core.Contracts.Shared.Categories
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User, Auth.Roles.Admin)]
    public class GetAllCategories : IRemoteQuery<List<CategoryDTO>>
    { }
}
