using System.Collections.Generic;
using FurnitureShop.Core.Contracts.Mobile.Products;

namespace FurnitureShop.Core.Contracts.Mobile.ShoppingCart
{
    public class ShoppingCartDTO
    {
        public double Price { get; set; }
        public IEnumerable<ShoppingCartProductDTO> ShoppingCartProducts { get; set; }
    }
    public class ShoppingCartProductDTO : ProductDTO
    {
        public int Amount { get; set; }
    }
}
