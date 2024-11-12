package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pthttm.retail.model.Product;
import pthttm.retail.service.ProductService;

import java.util.List;

@Controller
public class ProductController {
    private final ProductService productService;
    @Autowired  // Đảm bảo @Autowired có mặt ở constructor
    public ProductController(ProductService productService) {
        this.productService = productService;
    }
    @GetMapping("/bestselling")
    public String showPopularProducts(Model model) {
        List<Product> popularProducts = productService.getPopularProducts();
        model.addAttribute("popularProducts", popularProducts );
        return "danhmuc/bestselling";
    }

    @GetMapping("/newfruit")
    public String getAllProductsSortedByDate(Model model) {
        List<Product> sortedProducts = productService.getAllProductsSortedByDate();
        model.addAttribute("products", sortedProducts); // Thêm danh sách sản phẩm đã sắp xếp vào model
        return "danhmuc/newfruit"; // Tên view để hiển thị sản phẩm
    }

    @GetMapping("/inland")
    public String getProductsByCategoryTN(Model model) {
        List<Product> products = productService.getProductsByCategoryTN();
        model.addAttribute("products", products); // Thêm danh sách sản phẩm vào model
        return "danhmuc/inland"; // Tên view để hiển thị sản phẩm
    }
}
