package pthttm.retail.controller;

import jakarta.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Nutrient;
import pthttm.retail.model.Product;
import pthttm.retail.service.CustomerService;
import pthttm.retail.service.NutrientService;
import pthttm.retail.service.OrderService;
import pthttm.retail.service.ProductService;

import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@Controller
public class CustomerController {
    private final CustomerService customerService;
    private final OrderService orderService;
    private final ProductService productService;
    @Autowired
    private NutrientService nutrientService;
    public CustomerController(OrderService orderService,CustomerService customerService, ProductService productService) {
        this.orderService = orderService;
        this.customerService= customerService;
        this.productService = productService;
    }

    @GetMapping("/customer/purchase-history")
    public String getPurchaseHistory(Model model, HttpSession sesson){
        Customer customer = customerService.getCustomerById(3);
        /*List<Order> orders = orderService.getAllOrderByCustomer(customer);*/
        model.addAttribute("orders",customer.getOrders());
        return "/customer/page-purchase-history";
    }

    @GetMapping("/customer")
    public String getCustomerInfo(){
        return "customer/page-personal";
    }

    @GetMapping("/home")
    public String getPageHome(
            @RequestParam(required = false) String sort1,
            @RequestParam(required = false) String sort2,
            @RequestParam(required = false) String sort3,
            @RequestParam(required = false) String sort4,
            @RequestParam(required = false) String sort5,
            Model model) throws IOException {

        List<Product> products = productService.getAllProduct();
        Logger logger = LoggerFactory.getLogger(this.getClass());
        if (products == null || products.isEmpty()) {
            logger.info("No products found.");
        } else {
            model.addAttribute("products",products);
            products.forEach(product -> logger.info(product.toString()));
        }
        List<Product> product1 = productService.getTopHotProducts();
        List<Product> product2 = productService.getBestSellingProducts(10);
        List<Product> product3 = productService.getTop10MostRecentProducts();
        String categoryIdTN = "TN";
        List<Product> product4 = productService.getProductsByCategory(categoryIdTN, 10);
        String categoryIdNN = "NN";
        List<Product> product5 = productService.getProductsByCategory(categoryIdNN, 10);

        // Sắp xếp danh sách sản phẩm
        sortProducts(product1, sort1);
        sortProducts(product2, sort2);
        sortProducts(product3, sort3);
        sortProducts(product4, sort4);
        sortProducts(product5, sort5);

        // Cập nhật model sau khi sắp xếp
        model.addAttribute("product1", product1);
        model.addAttribute("product2", product2);
        model.addAttribute("product3", product3);
        model.addAttribute("product4", product4);
        model.addAttribute("product5", product5);

        return "page-home";
    }

    private void sortProducts(List<Product> products, String sort) {
        Logger logger = LoggerFactory.getLogger(this.getClass());
        if (products == null || products.isEmpty()) {
            return;
        }

        if (sort == null) {
            return; // If no sort parameter is provided, keep the order as is
        }

        switch (sort) {
            case "price-up":
                products.sort(Comparator.comparingDouble(Product::getPrice));
                logger.debug("Sorting by price (low to high)");
                break;
            case "price-down":
                products.sort(Comparator.comparingDouble(Product::getPrice).reversed());
                logger.debug("Sorting by price (high to low)");
                break;
            default:
                logger.debug("No valid sorting parameter, keeping the default order.");
                break;
        }
    }

    @GetMapping("/detail")
    public String getProductDetail(@RequestParam("id") String productId, Model model) {
        Product product = productService.getProductById(productId);

//        if (product == null) {
//            model.addAttribute("error", "Không tìm thấy sản phẩm với ID: " + productId);
//            return "error-page";
//        }

        // Lấy các sản phẩm tương tự
        List<Product> similarProducts = productService.findSimilarProducts(productId);

        model.addAttribute("product", product);
        model.addAttribute("similarProducts", similarProducts);
        return "product-details"; // Đảm bảo view này tồn tại
    }

}
