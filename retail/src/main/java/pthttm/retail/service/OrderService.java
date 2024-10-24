package pthttm.retail.service;

import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Service;
import pthttm.retail.model.Customer;
import pthttm.retail.model.Order;
import pthttm.retail.repository.OrderItemRepository;
import pthttm.retail.repository.OrderRepository;

import java.time.LocalDateTime;
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

    public List<Order> getAllOrderByShipStatus(String shipStatus){
        return (List<Order>) orderRepository.findByShipStatus(shipStatus);
    }

    public List<Order> getAllOrderByPayStatusAndShipStatus(String payStatus, String shipStatus){
        return (List<Order>) orderRepository.findByPayStatusAndShipStatus(payStatus,shipStatus);
    }

    public Order getOrderById(String orderId){
        return orderRepository.findById(orderId).orElse(null);
    }
    public void saveOrder(Order order ){
        order.setLastUpdate(LocalDateTime.now());
        orderRepository.save(order);
    }

    public List<Order> getAllOrderByCustomer(Customer customer){
        return orderRepository.findByCustomer(customer);
    }

/*    public List<Order> getAllOrderByCustomer(Customer customer){
        return (List<Order>) orderRepository.findByCustomer(customer);
    }*/
}
