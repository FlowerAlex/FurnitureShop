using System;
using System.Collections.Generic;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.Categories
{
    [AllowUnauthorized]
    public class GetAllCategories : IRemoteQuery<List<CategoryDTO>>
    { }
}
