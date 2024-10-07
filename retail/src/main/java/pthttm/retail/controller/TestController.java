package pthttm.retail.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.IOException;

@Controller
public class TestController {


    @GetMapping("/header")
    public String getHeader(Model model) throws IOException {
        return "comp-header";
    }
    @GetMapping("/")
    public String getIndex(Model model) throws IOException {
        return "index";
    }

    @GetMapping("/home")
    public String FirstTest (Model model) throws IOException {
        return "index";
    }

    @GetMapping("/cart")
    public String getCartPage(){
        return "page-cart";
    }

}
