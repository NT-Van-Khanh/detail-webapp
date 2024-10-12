package pthttm.retail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pthttm.retail.model.ImageProduct;
import pthttm.retail.model.Product;
import pthttm.retail.service.*;

import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Comparator;
import java.util.List;
@Controller
public class ManageController {
    private final FirebaseService firebaseService;
    private final CategoryService categoryService;
    private final ProductService productService;
    private final BrandService brandService;
    private final UnitService unitService;


    @Autowired
    public ManageController(FirebaseService firebaseService, CategoryService categoryService, ProductService productService, BrandService brandService,UnitService unitService) {
        this.firebaseService = firebaseService;
        this.categoryService = categoryService;
        this.productService = productService;
        this.brandService = brandService;
        this.unitService = unitService;
    }

    @GetMapping("manage/product")
    public String getProduct(Model model,
                             @RequestParam(value = "sort-product", required = false, defaultValue = "ID") String sortBy){
        List<Product> products = productService.getAllProduct();
        if (!products.isEmpty()) {
            products= sortProduct(products,sortBy);
            model.addAttribute("products", products);
            model.addAttribute("sortBy", sortBy);
        }else {
            LoggerFactory.getLogger(this.getClass()).info("Không tìm thấy sản phẩm.");
        }
        return "manage/page-manage-product";
    }

    @GetMapping("manage/add-product")
    public String addProduct(Model model) throws IOException {
        model.addAttribute("product", new Product());
        model.addAttribute("categories",categoryService.getAllCategory());
        model.addAttribute("brands",brandService.getAllBrand());
        model.addAttribute("units",unitService.getAllUnit());
        return "manage/page-manage-add-product";
    }

    @PostMapping("manage/add-product")
    public String addProduct( @RequestParam("image") MultipartFile image, @ModelAttribute Product product, RedirectAttributes redirectAttributes){
        product.setId(productService.createAutoId());
        if(!image.isEmpty())
            try (InputStream imageInputStream = image.getInputStream()) {
                firebaseService.uploadObject(product.getId()+".png", image.getInputStream(),image.getContentType());
            } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi khi tải ảnh lên Firebase.");
            e.printStackTrace();
            }

        try {productService.saveProduct(product);}
        catch (Exception e) {
            redirectAttributes.addFlashAttribute("message", "Lỗi thêm dữ liệu và database.");
            e.printStackTrace();
        }
        redirectAttributes.addFlashAttribute("message", "Thêm sản phẩm thành công!");
        return "redirect:/manage/add-product";
    }


    @GetMapping("manage/edit-product/{id}")
    public String updateProduct(Model model,@PathVariable("id") String productId){
        Product product = productService.getProductById(productId);
        model.addAttribute("categories",categoryService.getAllCategory());
        model.addAttribute("brands",brandService.getAllBrand());
        model.addAttribute("units",unitService.getAllUnit());
        model.addAttribute("product",product);
        return "manage/page-manage-edit-product";
    }

    @PostMapping("manage/edit-product/{id}")
    public String updateProduct(@RequestParam("action") String action, @RequestParam("image") MultipartFile image, @PathVariable("id") String productId,
                                @ModelAttribute Product product, RedirectAttributes redirectAttributes){
        System.out.println(productId);
        if(action.equals("UPDATE")){
            if(!image.isEmpty()) {
               try (InputStream imageInputStream = image.getInputStream()) {
                    firebaseService.uploadObject(product.getId() + ".png", image.getInputStream(), image.getContentType());
                } catch (IOException e) {
                    redirectAttributes.addFlashAttribute("message", "Lỗi khi tải ảnh lên Firebase.");
                    e.printStackTrace();
                }
            }
            product.setId(productId);
            try {
                productService.saveProduct(product);
                redirectAttributes.addFlashAttribute("message", "Cập nhật sản phẩm thành công!!");
            }
            catch (Exception e) {
                redirectAttributes.addFlashAttribute("message", "Lỗi lưu dữ liệu và database.");
                e.printStackTrace();
            }
            return "redirect:/manage/edit-product/"+productId;
        }else if (action.equals("DELETE")) {
            productService.deleteProduct(productId);
            redirectAttributes.addFlashAttribute("message", "Xóa sản phẩm thành công!");
            return "redirect:/manage/product";
        }
            return "redirect:/manage/product";
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


    private String getImageUpload() throws IOException {
        InputStream imageStream = firebaseService.getObject("upload-regular-96.png");
        if (imageStream != null) {
            byte[] imageBytes = imageStream.readAllBytes();
            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
            return base64Image;
        } else {
            return "";
        }
    }
    private List<Product> sortProduct(List<Product> products,String sortBy){
        switch (sortBy) {
            case "NAME":
                products.sort(Comparator.comparing(Product::getName));
                break;
            case "QUANTITY":
                products.sort(Comparator.comparing(Product::getQuantity));
                break;
            case "PRICE":
                products.sort(Comparator.comparing(Product::getPrice));
                break;
            case "CREATE":
                products.sort(Comparator.comparing(Product::getCreateAt));
                break;
/*                case "UPDATE":
                    products.sort(Comparator.comparing(Product::getUpdateAt));
                    break;*/
            default:
                products.sort(Comparator.comparing(Product::getId));
                break;
        }
        return products;
    }
    /*
    @GetMapping("manage/view-product/{id}")
    public String viewProduct(Model model, @PathVariable("id") String productId){
        Product product = productService.getProductById(productId);
        model.addAttribute("product",product);
        return "manage/page-manage-edit-product";
    }
*/
}
