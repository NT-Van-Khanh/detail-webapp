package pthttm.retail.service;

import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import pthttm.retail.model.Product;
import pthttm.retail.repository.OrderItemRepository;
import pthttm.retail.repository.ProductRepository;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProduct(){
        return (List<Product>) productRepository.findAll();
    }
    //https://www.codejava.net/frameworks/spring-boot/spring-data-jpa-filter-search-examples
    public Product getProductById(String productId){
        return (Product) productRepository.findById(productId).orElse(null);
    }

    public List<Product> fillProductByOutOfStock(){
        return (List<Product>) productRepository.findByQuantity(0);
    }

    public Product saveProduct(Product product) throws Exception{
        product.setLastUpdate(LocalDateTime.now());
        return productRepository.save(product);
    }

    public void deleteProduct(String productId){
        productRepository.deleteById(productId);
    }

    public String createAutoId(){
        List<Product> products = (List<Product>) productRepository.findAll();
        int newProductNumber;
        if(products.size()<1) newProductNumber= 1;
        else {
            String currentProductId = products.get(products.size() - 1).getId().strip();
            newProductNumber = Integer.parseInt(currentProductId.substring(2)) + 1;
        }
        return String.format("SP%06d",newProductNumber);//%06d: nếu có ít hơn 6 chữ số thì thêm 0 vào trước đến khi length=6
    }
    public List<Product> findAllOrderByCreateAtDesc() {
        return productRepository.findAllByOrderByCreateAtDesc();
    }
    public List<Product> findSimilarProducts(String productId) {
        return productRepository.findSimilarProducts(productId);
    }

//    public List<Product> findAllByIdOrNameOrBrand(String text){
//        return text==null ?
//            (List<Product>) productRepository.findAll() : productRepository.findByIdOrNameOrBrand(text,text);
//    }
    @Autowired
    private OrderItemRepository orderItemRepository;
    public List<Product> getBestSellingProducts(int limit) {
        List<Object[]> results = orderItemRepository.findBestSellingProducts(PageRequest.of(0, limit));
        List<Product> bestSellingProducts = new ArrayList<>();

        for (Object[] result : results) {
            String productId = (String) result[0];
            Product product = productRepository.findById(productId).orElse(null);
            if (product != null) {
                bestSellingProducts.add(product);
            }
        }

        return bestSellingProducts;
    }
    public List<Product> getProductsByCategory(String categoryId, int limit) {
        return productRepository.findAllByCategoryId(categoryId, PageRequest.of(0, limit));
    }
    public List<Product> getTopHotProducts() {
        List<Product> hotProducts = productRepository.findTopHotProductsByQuantity();
        return hotProducts.size() > 10 ? hotProducts.subList(0, 10) : hotProducts;  // Limit to 10 products
    }
    public List<Product> getTop10MostRecentProducts() {
        List<Product> recentProducts = productRepository.findTop10MostRecentProducts();
        return recentProducts.size() > 10 ? recentProducts.subList(0, 10) : recentProducts;  // Limit to 10 products
    }

    public List<Product> getPopularProducts() {
        if (orderItemRepository == null) {
            throw new UnsupportedOperationException("OrderItemRepository is not available.");
        }
        return orderItemRepository.findPopularProducts();
    }

    public List<Product> getAllProductsSortedByDate() {
        return productRepository.findAllByOrderByCreateAtDesc(); // Lấy tất cả sản phẩm sắp xếp theo ngày tạo
    }

    public List<Product> getProductsByCategoryTN() {
        return productRepository.findByCategory_Id("TN"); // Lấy các sản phẩm có category_id = "TN"
    }
}
