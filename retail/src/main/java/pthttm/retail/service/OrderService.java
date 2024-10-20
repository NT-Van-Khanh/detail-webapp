package pthttm.retail.service;

import org.springframework.stereotype.Service;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Order;
import pthttm.retail.repository.OrderItemRepository;
import pthttm.retail.repository.OrderRepository;

import java.util.List;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderItemRepository orderItemRepository;

    public OrderService(OrderRepository orderRepository, OrderItemRepository orderItemRepository) {
        this.orderRepository = orderRepository;
        this.orderItemRepository = orderItemRepository;
    }

    public List<Order> getAllOrder(){
        return (List<Order>) orderRepository.findAll();
    }
    public List<Order> getAllOrderByPayStatus(String payStatus){
        return (List<Order>) orderRepository.findByPayStatus(payStatus);
    }

/*    public List<Order> getAllOrderByCustomer(Customer customer){
        return (List<Order>) orderRepository.findByCustomer(customer);
    }*/
}
