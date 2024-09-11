package com.pthttm.retail.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
    @GetMapping("")
    String FirstTest (){
        return "done";
    }
}
