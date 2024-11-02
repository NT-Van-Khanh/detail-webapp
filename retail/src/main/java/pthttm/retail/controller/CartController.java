package pthttm.retail.controller;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pthttm.retail.model.CartItem;
import pthttm.retail.service.CartItemService;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Controller
//@RequestMapping("/gio-hang")
public class CartController {
    private CartItemService cartItemService;
    public CartController(CartItemService cartItemService) {
        this.cartItemService=cartItemService;
    }
    @GetMapping("/gio-hang")
    public String gioHang(Model model){
        ArrayList<CartItem> cartItems = cartItemService.getAllCartItems();
        model.addAttribute("cartItems", cartItems);
        //Tính tổng tiền trong giỏ hàng
        double grandTotal = cartItems.stream()
                .mapToDouble(item -> item.getPrice() * item.getQuantity())
                .sum();
        model.addAttribute("grandTotal", grandTotal);
        int totalItems = cartItems.stream()
                .mapToInt(CartItem::getQuantity) // Sum the quantity of each item
                .sum();
        model.addAttribute("totalItems", totalItems);
        return "gio-hang";
    }
    @PostMapping("/cart/add")
    public String addProduct(@RequestParam String productId,Model model) {
        //return "redirect:/thanh-toan";
        ArrayList<CartItem> cartItems = cartItemService.getAllCartItems();
        for (CartItem item : cartItems) {
            if (item.getProductId().equals(productId)) {
                int newQuantity = item.getQuantity() +1;
                item.setQuantity(newQuantity);

            }
        }
        cartItemService.setCartItems(cartItems);
        model.addAttribute("cartItems", cartItems);
        return "gio-hang";
    }

    @PostMapping("/cart/update")
    public String updateCart(@RequestParam Map<String, String> quantities, Model model) {
        // Cập nhật giỏ hàng
        List<CartItem> cartItems = cartItemService.getAllCartItems();
        for (Map.Entry<String, String> entry : quantities.entrySet()) {
            String productId = entry.getKey(); // Product ID
            int quantity = Integer.parseInt(entry.getValue());
            for (CartItem item : cartItems) {
                if (item.getProductId().equals(productId)) {
                    item.setQuantity(quantity);
                }
            }
        }
        //Xóa các bản ghi không có trong quantities
        cartItems.removeIf(item -> !quantities.containsKey(item.getProductId()));
        return "gio-hang";
    }
    @DeleteMapping("/cart/remove/{productId}")
    @ResponseStatus(HttpStatus.NO_CONTENT) // Trả về mã 204 nếu thành công
    public void removeItemFromCart(@PathVariable String productId, Model model) {
        ArrayList<CartItem> cartItems = cartItemService.getAllCartItems();

        if (cartItems != null) {
            cartItems.removeIf(item -> item.getProductId().equals(productId));
            cartItemService.setCartItems(cartItems);
            model.addAttribute("cartItems", cartItems);
        }
    }

}