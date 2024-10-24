package pthttm.retail.service;

import org.springframework.stereotype.Service;
import pthttm.retail.model.Customer;
import pthttm.retail.model.OrderProduct;
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

    public List<OrderProduct> getAllOrder(){
        return (List<OrderProduct>) orderRepository.findAll();
    }
    public List<OrderProduct> getAllOrderByPayStatus(String payStatus){
        return (List<OrderProduct>) orderRepository.findByPayStatus(payStatus);
    }

    public List<OrderProduct> getAllOrderByShipStatus(String shipStatus){
        return (List<OrderProduct>) orderRepository.findByShipStatus(shipStatus);
    }

    public List<OrderProduct> getAllOrderByPayStatusAndShipStatus(String payStatus, String shipStatus){
        return (List<OrderProduct>) orderRepository.findByPayStatusAndShipStatus(payStatus,shipStatus);
    }

    public OrderProduct getOrderById(String orderId){
        return orderRepository.findById(orderId).orElse(null);
    }
    public void saveOrder(OrderProduct order ){
        order.setLastUpdate(LocalDateTime.now());
        orderRepository.save(order);
    }

    public List<OrderProduct> getAllOrderByCustomer(Customer customer){
        return orderRepository.findByCustomer(customer);
    }

/*    public List<Order> getAllOrderByCustomer(Customer customer){
        return (List<Order>) orderRepository.findByCustomer(customer);
    }*/
}
