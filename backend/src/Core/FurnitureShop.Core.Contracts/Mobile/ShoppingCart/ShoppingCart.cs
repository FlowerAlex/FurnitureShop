using System;
using LeanCode.CQRS;
using LeanCode.CQRS.Security;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    [AuthorizeWhenHasAnyOf(Auth.Roles.User)]
    public class ShoppingCart : IRemoteQuery<ShoppingCartDTO?>
    {

    }
}
