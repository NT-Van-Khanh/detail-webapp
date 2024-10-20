package pthttm.retail.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pthttm.retail.service.MailService;

@Controller
public class LoginController {
    private final MailService mailService;

    @Autowired
    public LoginController(MailService mailService) {
        this.mailService = mailService;
    }

    @GetMapping("/login")
    public String getLogin(){
        return "/login/page-login";
    }

    @GetMapping("/forgot-password")
    public String getForgotPassword(){
        return "/login/page-forgot-password";
    }

/*   @GetMapping("/confirm/mail")
    public String confirmMail(){
        return "/login/register/page-confirm-email";
    }*/

    @GetMapping("/confirm/phone")
    public String confirmPhone(){
        return "/login/register/page-confirm-phone";
    }

    @PostMapping("/confirm/mail")
    public String confirmMail(Model model, @RequestParam("phone") String phone){
        model.addAttribute("phone",phone);
        return "/login/register/page-confirm-email";
    }

    @GetMapping("/verification")
    public String getVerificationCode(){
        return "/login/page-verification-code";
    }
    @PostMapping("/register")
    public  String getRegister(Model model, @RequestParam("email") String email){
        return "/login/register/page-register";
    }
}
