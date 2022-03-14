using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    public class ShoppingCartInfoDTO
    {
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
        public IEnumerable<ShoppingCartProductDTO> ShoppingCartProducts { get; set; }
    }

    public class ShoppingCartDTO
    {
        public Guid Id { get; set; }
        public ShoppingCartInfoDTO ShoppingCartInfo { get; set; }

    }
    public class ShoppingCartProductDTO
    {
        public Guid? ProductId { get; set; }
        public int Amount { get; set; }
    }
}
