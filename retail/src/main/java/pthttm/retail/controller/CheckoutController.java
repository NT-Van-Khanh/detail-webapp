package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pthttm.retail.model.CartItem;
import pthttm.retail.model.Invoice;
import pthttm.retail.model.InvoiceDetails;
import pthttm.retail.service.CartItemService;
import pthttm.retail.service.InvoiceDetailsService;
import pthttm.retail.service.InvoiceService;

import java.time.LocalDateTime;
import java.util.List;

@Controller
//@RequestMapping("/thanh-toan")
public class CheckoutController {
	private CartItemService cartItemService;
	@Autowired
    private InvoiceService invoiceService;
	@Autowired
    private InvoiceDetailsService invoiceDetailsService;
	public CheckoutController(CartItemService cartItemService) {
		this.cartItemService=cartItemService;
	}
    @GetMapping("/thanh-toan")
    public String thanhToan(Model model){
    	List<CartItem> cartItems = cartItemService.getAllCartItems();
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
    	model.addAttribute("invoice", new Invoice());
    	
        return "thanh-toan";
    }
    @PostMapping("/thanh-toan")
    public String placeOrder(@RequestParam String firstName,
            @RequestParam String lastName,
            @RequestParam String city,
            @RequestParam String address,
            @RequestParam String phone,
            @RequestParam String email,
            @RequestParam String notes,
            @RequestParam double grandTotal) {
			Invoice invoice = new Invoice();
			invoice.setFirstName(firstName);
			invoice.setLastName(lastName);
			invoice.setCity(city);
			invoice.setAddress(address);
			invoice.setPhone(phone);
			invoice.setEmail(email);
			invoice.setNotes(notes);			
			invoice.setGrandTotal(grandTotal);
			invoice.setOrderDateTime(LocalDateTime.now());
			invoiceService.saveInvoice(invoice);
			
			// Lưu tên sản phẩm và số lượng sản phẩm vào bảng InvoiceDetails record
			List<CartItem> cartItems = cartItemService.getAllCartItems();
		    for (CartItem item : cartItems) {
		        InvoiceDetails detail = new InvoiceDetails();
		        detail.setProductId(item.getProductId());
		        detail.setName(item.getName());
		        detail.setQuantity(item.getQuantity());
		        detail.setPrice(item.getPrice()); 
		        detail.setInvoice(invoice); 
		        invoice.addInvoiceDetail(detail); 
		    }
		    invoiceService.saveInvoice(invoice);
			return "redirect:/home"; 
    }
}
