package pthttm.retail.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Order;
import pthttm.retail.service.CustomerService;
import pthttm.retail.service.OrderService;

import java.util.List;

@Controller
public class CustomerController {
    private final CustomerService customerService;
    private final OrderService orderService;

    public CustomerController(OrderService orderService,CustomerService customerService) {
        this.orderService = orderService;
        this.customerService= customerService;
    }

    @GetMapping("/purchase-history")
    public String getPurchaseHistory(Model model, HttpSession sesson){
        Customer customer = customerService.getCustomerById(3);
        /*List<Order> orders = orderService.getAllOrderByCustomer(customer);*/
        model.addAttribute("orders",customer.getOrders());
        return "/customer/page-purchase-history";
    }

    @GetMapping("/customer")
    public String getCustomerInfo(){
        return "customer/page-personal";
    }
}
