package pthttm.retail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {
    @GetMapping("/purchase-history")
    public String getPurchaseHistory(){
        return "/customer/page-purchase-history";
    }

    @GetMapping("/customer")
    public String getCustomerInfo(){
        return "customer/page-personal";
    }
}
