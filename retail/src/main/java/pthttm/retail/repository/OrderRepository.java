package pthttm.retail.repository;

import org.springframework.data.repository.CrudRepository;
import pthttm.retail.model.Customer;
import pthttm.retail.model.OrderProduct;

import java.util.List;

public interface OrderRepository extends CrudRepository<OrderProduct,String> {
    List<OrderProduct> findByPayStatus(String payStatus);
    List<OrderProduct> findByShipStatus(String shipStatus);
    List<OrderProduct> findByPayStatusAndShipStatus(String payStatus, String shipStatus);
    List<OrderProduct> findByCustomer(Customer customer);
}
