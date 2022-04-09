using System;
using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    public class ShoppingCartInfoDTO
    {
        public Guid? UserId { get; set; }
        public double Price { get; set; }
        public IEnumerable<ShoppingCartProductDTO> ShoppingCartProducts { get; set; }
    }

    public class ShoppingCartDTO
    {
        public Guid Id { get; set; }
        public ShoppingCartInfoDTO ShoppingCartInfo { get; set; }

    }
    public class ShoppingCartProductDTO 
    {
        public int Amount { get; set; }
        public ProductDTO Product {get;set;}
        public Guid ShoppingCartId { get; set; }
    }
}
