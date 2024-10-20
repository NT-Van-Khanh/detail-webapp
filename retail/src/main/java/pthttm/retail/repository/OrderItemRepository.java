package pthttm.retail.repository;

import org.springframework.data.repository.CrudRepository;
import pthttm.retail.model.OrderItem;

public interface OrderItemRepository extends CrudRepository<OrderItem,Integer> {
}
