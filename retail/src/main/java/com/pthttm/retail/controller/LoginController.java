package com.pthttm.retail.controller;

import org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping("/login")
    public String getLogin(){
        return "login";
    }

    @GetMapping("/forgot-password")
    public String getForgotPassword(){
        return "login-forgot";
    }

    @GetMapping("/register")
    public  String getRegister(){

        return "login-register";
    }
}
