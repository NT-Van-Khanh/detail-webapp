package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pthttm.retail.service.FirebaseService;

import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

@Controller
public class ManageController {
    private final FirebaseService firebaseService;

    @Autowired
    public ManageController(FirebaseService firebaseService) {
        this.firebaseService = firebaseService;
    }

    @GetMapping("manage/product")
    public String getProduct(){
        return "manage/page-manage-product";
    }

    @GetMapping("manage/add-product")
    public String addProduct(Model model) throws IOException {
        InputStream imageStream = firebaseService.getObject("upload-regular-96.png");
        if (imageStream != null) {
            byte[] imageBytes = imageStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            model.addAttribute("base64ImageUpload", base64Image);
        } else {
            model.addAttribute("base64ImageUpload", "");
        }
        return "manage/page-manage-add-product";
    }

    @GetMapping("manage/view-product")
    public String viewProduct(){
        return "manage/page-manage-view-product";
    }

    @GetMapping("manage/bill")
    public String getBill(){
        return "manage/page-manage-bill";
    }

    @GetMapping("manage/view-bill")
    public String viewBill(){
        return "manage/page-manage-view-bill";
    }

    @GetMapping("manage/account")
    public String getAccount(){
        return "manage/page-manage-account";
    }
}
