package pthttm.retail.repository;

import org.aspectj.weaver.ast.Or;
import org.springframework.data.repository.CrudRepository;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Order;

import java.util.List;

public interface OrderRepository extends CrudRepository<Order,String> {
    List<Order> findByPayStatus(String payStatus);
    List<Order> findByShipStatus(String shipStatus);
}
