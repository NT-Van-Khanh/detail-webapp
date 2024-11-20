package pthttm.retail.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pthttm.retail.model.Brand;
import pthttm.retail.model.Product;
import pthttm.retail.service.ProductService;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
public class ProductController {
    private final ProductService productService;
    @Autowired  // Đảm bảo @Autowired có mặt ở constructor
    public ProductController(ProductService productService) {
        this.productService = productService;
    }
    @GetMapping("/bestselling")
    public String showPopularProducts(@RequestParam(value = "sort", required = false) String sort, Model model) {
        List<Product> popularProducts = productService.getPopularProducts();

        if ("price-up".equals(sort)) {
            popularProducts.sort(Comparator.comparingLong(Product::getPrice));
        } else if ("price-down".equals(sort)) {
            popularProducts.sort(Comparator.comparingLong(Product::getPrice).reversed());
        }

        model.addAttribute("popularProducts", popularProducts);
        model.addAttribute("sort", sort);
        return "danhmuc/bestselling";
    }

    @GetMapping("/newfruit")
    public String getAllProductsSortedByDate(@RequestParam(value = "sort", required = false) String sort, Model model) {
        List<Product> sortedProducts = productService.getAllProductsSortedByDate();
        if ("price-up".equals(sort)) {
            sortedProducts.sort(Comparator.comparingLong(Product::getPrice));
        } else if ("price-down".equals(sort)) {
            sortedProducts.sort(Comparator.comparingLong(Product::getPrice).reversed());
        }
        model.addAttribute("products", sortedProducts); // Thêm danh sách sản phẩm đã sắp xếp vào model
        model.addAttribute("sort", sort);
        return "danhmuc/newfruit"; // Tên view để hiển thị sản phẩm
    }

    @GetMapping("/inland")
    public String getProductsByCategoryTN(@RequestParam(value = "sort", required = false) String sort, Model model) {
        List<Product> products = productService.getProductsByCategoryTN();
        if ("price-up".equals(sort)) {
            products.sort(Comparator.comparingLong(Product::getPrice));
        } else if ("price-down".equals(sort)) {
            products.sort(Comparator.comparingLong(Product::getPrice).reversed());
        }
        model.addAttribute("products", products); // Thêm danh sách sản phẩm vào model
        model.addAttribute("sort", sort);
        return "danhmuc/inland"; // Tên view để hiển thị sản phẩm
    }

    @GetMapping("/search_ml")
    public String search(@RequestParam("txtSearch") String query, Model model) {
        // Lấy danh sách các ID sản phẩm từ API Django
        List<String> productIds = productService.searchProductIds(query);
        List<Product> products= new ArrayList<>();
        if(!productIds.isEmpty()){
            products = productService.findAllById(productIds);
        }else{
            products = productService.findByName(query);
        }
        // Giả sử bạn đã có phương thức để tìm sản phẩm từ DB theo các ID này

        Set<Brand> brands=null;
        if(products!=null){
            brands=products.stream()
                    .map(Product::getBrand)
                    .collect(Collectors.toSet());
        }
        // Thêm danh sách sản phẩm vào Model để truyền cho view
        model.addAttribute("products", products);
        model.addAttribute("brands", brands);
        return "search-page";
    }

}
