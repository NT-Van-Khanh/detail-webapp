package com.pthttm.retail.controller;
import com.pthttm.retail.service.FirebaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

/*@RestController
public class TestController {
    @GetMapping("/hello")
    String FirstTest (){
        return "done";
    }
}*/
@Controller
public class TestController {
    private final FirebaseService firebaseService;

    @Autowired
    public TestController(FirebaseService firebaseService) {
        this.firebaseService = firebaseService;
    }

    @GetMapping("/hello")
    public String FirstTest (Model model) throws IOException {
        InputStream imageStream = firebaseService.getObject("logo-web.png");
        if(imageStream !=null){
            byte[] imageBytes = imageStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            model.addAttribute("base64Image",base64Image);
        }else{
            model.addAttribute("base64Image","");
        }

        return "index";
    }

    @GetMapping("/cart")
    public String getCartPage(){
        return "page-cart";
    }

}
