package com.pthttm.retail.controller;
import com.pthttm.retail.service.FirebaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

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
