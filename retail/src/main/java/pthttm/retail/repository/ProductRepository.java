package pthttm.retail.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Product;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, String> {
    List<Product> findByQuantity(int quantity);
    @Query("SELECT p FROM Product p WHERE p.category.id = (SELECT p2.category.id FROM Product p2 WHERE p2.id = :productId) AND p.id <> :productId")
    List<Product> findSimilarProducts(@Param("productId") String productId);
    List<Product> findAllByOrderByCreateAtDesc();
}
