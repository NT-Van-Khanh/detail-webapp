package pthttm.retail.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import pthttm.retail.model.*;
import pthttm.retail.service.*;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller
@SessionAttributes("cartItems")
public class CheckoutController {

	private final ProductService productService;

	private final OrderService orderService;

	private final OrderItemService orderItemService;

	private final CustomerService customerService;

	public CheckoutController(ProductService productService, OrderService orderService, OrderItemService orderItemService, CustomerService customerService) {
        this.productService = productService;
        this.orderService = orderService;
        this.orderItemService = orderItemService;
        this.customerService = customerService;
    }

	@GetMapping("/thanh-toan")
	public String thanhToan(Model model) {
		// Lấy giỏ hàng từ model (tự động Spring sẽ quản lý session)
		List<CartItem> cartItems = (List<CartItem>) model.getAttribute("cartItems");

		if (cartItems == null) {
			cartItems = new ArrayList<>();  // Nếu giỏ hàng trống thì tạo danh sách trống
			model.addAttribute("cartItems", cartItems);  // Lưu giỏ hàng vào model (Spring sẽ quản lý session)
		}

		// Tính tổng tiền giỏ hàng
		double grandTotal = cartItems.stream()
				.mapToDouble(item -> item.getPrice() * item.getQuantity())
				.sum();
		model.addAttribute("grandTotal", grandTotal);

		// Tạo một đối tượng hóa đơn mới để liên kết với form
		Invoice invoice = new Invoice();
		model.addAttribute("invoice", invoice);

		return "thanh-toan";  // Chuyển về trang thanh toán
	}

	// Post mapping để xử lý thanh toán
	@PostMapping("/thanh-toan")
	public String placeOrder(@RequestParam String firstName,
							 @RequestParam String lastName,
							 @RequestParam String city,
							 @RequestParam String address,
							 @RequestParam String phone,
							 @RequestParam String email,
							 @RequestParam String notes,
							 @RequestParam double grandTotal,
							 Model model,HttpSession session) {

		List<CartItem> cartItems = (List<CartItem>) model.getAttribute("cartItems");

		if (cartItems == null || cartItems.isEmpty()) {
			return "redirect:/gio-hang";  // Nếu giỏ hàng trống, chuyển hướng về trang giỏ hàng
		}


		//Lấy thông tin trong cartItems để đưa vào OrderItems

		//Tạo đơn hàng mới
		OrderProduct orderProduct = new OrderProduct();
		Integer nextValue = orderService.getNextSequenceValue();
		String orderId= "HD" + String.format("%05d", nextValue);
		orderProduct.setId(orderId);
		orderProduct.setTotalCost(cartItems.stream()
				.mapToLong(item -> Math.round(item.getTotalAmount())).sum());
		orderProduct.setPayStatus("CH");
		orderProduct.setShipStatus("DG");
		orderProduct.setCreateAt(LocalDateTime.now());
		orderProduct.setLastUpdate(LocalDateTime.now());
		orderProduct.setFlag(true);
		orderProduct.setAddress(address);

		//Lấy thông tin khách hàng login
		//
		SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		Object principal=null;
		String username=null;
		if (securityContext != null && securityContext.getAuthentication() != null) {
			principal = securityContext.getAuthentication().getPrincipal();
		}
		if (principal instanceof CustomerDetails) {
			username=((CustomerDetails) principal).getUsername();
		}
		Customer customer=null;
		//Nếu khách hàng login bằng email hay số điện thoại
		if (username.contains("@")) {
			customer= customerService.getByEmail(username);
		}
		else
			customer= customerService.getByPhone(username);

		orderProduct.setCustomer(customer);
		//Lấy thông tin employee của một sản phẩm đầu tiên trong danh sách
		Product firstProduct = productService.getProductById(cartItems.get(0).getProductId());
		orderProduct.setEmployee(firstProduct.getEmployee());

		// Lưu thông tin order_product
		orderService.saveOrder(orderProduct);

		// Lưu thông tin các sản phẩm trong đơn hàng
		for (CartItem cartItem : cartItems) {
			// Fetch the Product entity
			Product product = productService.getProductById(cartItem.getProductId());
			OrderItem orderItem = new OrderItem();
			orderItem.setOrder(orderProduct); // Set the parent order
			orderItem.setProduct(product); // Associate with the Product entity
			orderItem.setQuantity(cartItem.getQuantity());
			orderItem.setTotalCost(Math.round(cartItem.getTotalAmount())); // Total amount as a Long
			orderItem.setCreateAt(LocalDateTime.now());
			orderItem.setFlag(true);
			// Save the OrderItem
			orderItemService.save(orderItem);
		}

		// Xóa giỏ hàng sau khi thanh toán
		model.addAttribute("cartItems", new ArrayList<>()); // Giỏ hàng sẽ được reset sau khi thanh toán

		return "redirect:/home";  // Chuyển hướng về trang chủ sau khi thanh toán
	}
}
