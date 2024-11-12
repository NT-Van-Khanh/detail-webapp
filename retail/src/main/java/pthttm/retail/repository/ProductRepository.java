package pthttm.retail.repository;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Brand;
import pthttm.retail.model.Product;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<Product, String> {
    List<Product> findByQuantity(int quantity);

//    List<Product> findByIdOrNameOrBrand(String id, String name, Brand brand);

    @Query("SELECT p FROM Product p WHERE p.category.id = (SELECT p2.category.id FROM Product p2 WHERE p2.id = :productId) AND p.id <> :productId")
    List<Product> findSimilarProducts(@Param("productId") String productId);
    List<Product> findAllByOrderByCreateAtDesc();

    List<Product> findAllByCategoryId(String categoryId, Pageable pageable);

    @Query("SELECT p FROM Product p WHERE p.flag = false ORDER BY p.quantity DESC")
    List<Product> findTopHotProductsByQuantity();
    @Query("SELECT p FROM Product p " +
            "JOIN OrderItem oi ON p.id = oi.product.id " +
            "GROUP BY p.id " +
            "ORDER BY COUNT(oi) DESC")
    List<Product> findTop10BestSellingProducts();
    @Query("SELECT p FROM Product p WHERE p.flag = false ORDER BY p.createAt DESC")
    List<Product> findTop10MostRecentProducts();

    List<Product> findByCategory_Id(String categoryId);

}
