package pthttm.retail.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pthttm.retail.model.Order;
import pthttm.retail.service.OrderService;

import java.util.Collection;
import java.util.Collections;
import java.util.Map;

@Controller
public class ManageDeliveryController {
    private final OrderService orderService;

    public ManageDeliveryController(OrderService orderService) {
        this.orderService = orderService;
    }

    @GetMapping("manage/delivery")
    public String getBill(Model model){
        model.addAttribute("orders",orderService.getAllOrder());
        return "manage/page-manage-delivery";
    }

    @PostMapping("/manage/update-payment-status/{orderId}")
    public ResponseEntity<?> updatePayStatus(@PathVariable String orderId,
                                             @RequestBody Map<String, String> body){
        String newPayStatus = body.get("payStatus");
        if (newPayStatus == null || newPayStatus.isEmpty()) {
            return ResponseEntity.badRequest().body("Invalid payment status.");
        }
        try {
            Order order = orderService.getOrderById(orderId);
            if (order == null) {
                return ResponseEntity.notFound().build();
            }
            order.setPayStatus(newPayStatus);
            orderService.saveOrder(order);
            return ResponseEntity.ok(Collections.singletonMap("success", true));
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body("Error updating payment status.");
        }
    }
}
