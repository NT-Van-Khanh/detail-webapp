package pthttm.retail.service;

import lombok.ToString;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pthttm.retail.model.Product;
import pthttm.retail.repository.ProductRepository;

import java.time.LocalDateTime;
import java.util.List;

@Service
public class ProductService {
    private final ProductRepository productRepository;

    @Autowired
    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    public List<Product> getAllProduct(){
        return (List<Product>) productRepository.findAll();
    }

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

}
