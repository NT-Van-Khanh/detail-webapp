package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
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
    private final CartItemService cartItemService;
    @Autowired
    public CartController(CartItemService cartItemService) {
        this.cartItemService=cartItemService;
    }
    @GetMapping("/gio-hang")
    public String getGioHang(Model model) {
        ArrayList<CartItem> cartItems = cartItemService.getAllCartItems();
        model.addAttribute("cartItems", cartItems);

        double grandTotal = cartItemService.getGrandTotal();
        model.addAttribute("grandTotal", grandTotal);

        int totalItems = cartItems.stream().mapToInt(CartItem::getQuantity).sum();
        model.addAttribute("totalItems", totalItems);
        return "gio-hang";
    }

    @PostMapping("/gio-hang/add")
    public String addItem(@RequestParam String productId, @RequestParam String productName,
                          @RequestParam Double price, @RequestParam Integer quantity) {
        CartItem newItem = new CartItem(productId, productName, price, quantity);
        cartItemService.addItem(newItem);
        return "redirect:/gio-hang";
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
    @PostMapping("/gio-hang/remove")
    public String removeItem(@RequestParam String productId) {
        cartItemService.removeItem(productId);
        return "redirect:/gio-hang";
    }
}