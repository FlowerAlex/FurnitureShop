using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    public class ShoppingCartInfoDTO
    {
        public Guid? UserId { get; set; }
        public decimal Price { get; set; }
        public List<ShoppingCartProductDTO> ShoppingCartProducts { get; set; }
    }

    public class ShoppingCartDTO
    {
        public Guid Id { get; set; }
        public ShoppingCartDTO OrderInfo { get; set; }

    }
    public class ShoppingCartProductDTO
    {
        public Guid? ProductId { get; set; }
        public int Amount { get; set; }
    }
}
