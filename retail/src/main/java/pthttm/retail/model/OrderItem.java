package pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Table(name="Order_item")
public class OrderItem {

    @Id
    @Column(name="id")
    private String id;

   // @Column(name="oder_id",nullable = false)
    @ManyToOne
    @JoinColumn(name="oder_id")
    private Order orderId;

    //@Column(name="product_id",nullable = false)
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product productId;

    @Column(name="quantity",nullable = false)
    private Integer quantity;

    @Column(name="total_cost", columnDefinition = "money", nullable = false)
    private  Long totalCost;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;


}
