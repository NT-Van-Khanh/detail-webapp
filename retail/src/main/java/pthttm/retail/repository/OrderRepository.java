package pthttm.retail.repository;

import org.springframework.data.repository.CrudRepository;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Order;

import java.util.List;

public interface OrderRepository extends CrudRepository<Order,String> {
    List<Order> findByPayStatus(String payStatus);
    List<Order> findByShipStatus(String shipStatus);
    List<Order> findByPayStatusAndShipStatus(String payStatus, String shipStatus);
    List<Order> findByCustomer(Customer customer);
}
