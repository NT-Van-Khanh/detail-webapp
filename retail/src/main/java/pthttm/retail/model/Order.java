package pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Collection;

@Entity
@Table(name = "Order")
public class Order {

    @Id
    @Column(name="id")
    private String id;

   // @Column(name="user_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "customer_id")
    private Customer customer;

    @Column(name="total_cost", columnDefinition = "money", nullable = false)
    private Long totalCost;

    @Column(name="status", nullable = false)
    private String status;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name = "create_at", nullable = false)
    private String createAt;

    @Column(name = "flag", nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private Collection<OrderItem> items;

    public Order() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    public Long getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Long totalCost) {
        this.totalCost = totalCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Collection<OrderItem> getItems() {
        return items;
    }

    public void setItems(Collection<OrderItem> items) {
        this.items = items;
    }
}
