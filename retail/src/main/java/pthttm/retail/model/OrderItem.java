package pthttm.retail.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Table(name="Order_item")
public class OrderItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private Integer id;

   // @Column(name="oder_id",nullable = false)
    @ManyToOne
    @JoinColumn(name="order_id")
    private OrderProduct order;

    //@Column(name="product_id",nullable = false)
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @Column(name="quantity",nullable = false)
    private Integer quantity;

    @Column(name="total_cost", columnDefinition = "money", nullable = false)
    private  Long totalCost;

    @CreationTimestamp
    @Column(name="created_at",updatable = false, nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

    public OrderItem() {
    }

    public OrderItem(OrderProduct order, Product product, Integer quantity, Long totalCost) {
       this.order = order;
       this.product = product;
       this.quantity = quantity;
       this.totalCost = totalCost;
    }

    public Integer getId() {
     return id;
    }

    public void setId(Integer id) {
     this.id = id;
    }

    public OrderProduct getOrder() {
     return order;
    }

    public void setOrder(OrderProduct order) {
     this.order = order;
    }

    public Product getProduct() {
     return product;
    }

    public void setProduct(Product product) {
     this.product = product;
    }

    public Integer getQuantity() {
     return quantity;
    }

    public void setQuantity(Integer quantity) {
     this.quantity = quantity;
    }

    public Long getTotalCost() {
     return totalCost;
    }

    public void setTotalCost(Long totalCost) {
     this.totalCost = totalCost;
    }

    public LocalDateTime getCreateAt() {
     return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
     this.createAt = createAt;
    }

    public boolean isFlag() {
     return flag;
    }

    public void setFlag(boolean flag) {
     this.flag = flag;
    }
}
