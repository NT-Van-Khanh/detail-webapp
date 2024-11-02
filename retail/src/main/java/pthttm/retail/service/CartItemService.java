package pthttm.retail.service;

import org.springframework.stereotype.Service;
import pthttm.retail.model.CartItem;

import java.util.ArrayList;
import java.util.Arrays;

@Service
public class CartItemService {
	private ArrayList<CartItem> cartItems=new ArrayList<>(Arrays.asList(
   		 new CartItem("SP000001", "Dâu tây", 55000D, 1),
         new CartItem("SP000003", "Sầu riêng", 39000D, 2),
         new CartItem("SP000008", "Cam", 69000D, 3)
));
	public void setCartItems(ArrayList<CartItem> cartItems) {
        this.cartItems = cartItems;
        
    }
    public ArrayList<CartItem> getAllCartItems() {    	
        return cartItems;
    }
    
 // Method thêm một sản phẩm vào giỏ hàng
    public void addCartItem(CartItem newCartItem) {
        cartItems.add(newCartItem);
    }
}