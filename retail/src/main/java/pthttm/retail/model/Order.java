package pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

@Entity
@Table(name = "[Order]")
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

    @Column(name="pay_status", nullable = false)
    private String payStatus;

    @Column(name="ship_status", nullable = false)
    private String shipStatus;

    @Temporal(TemporalType.TIMESTAMP)
/*    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")*/
    @Column(name = "create_at", nullable = false)
    private LocalDateTime createAt;

    @Column(name = "flag", nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "order", fetch = FetchType.EAGER)
    private Collection<OrderItem> items;

    public String getFormattedCreateAt() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");
        return createAt.format(formatter);
    }

    public String getFormattedShipStatus(){
        switch(shipStatus){
            case "HT":
                return "Đã hoàn tất";
            case "DG":
                return "Đang giao hàng";
            default:
                return shipStatus;
        }
    }

    public String getFormattedPayStatus(){
        switch(payStatus){
            case "HT":
                return "Đã thanh toán";
            case "CH":
                return "Chưa thanh toán";
            default:
                return payStatus;
        }
    }
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

    public String getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(String payStatus) {
        this.payStatus = payStatus;
    }

    public String getShipStatus() {
        return shipStatus;
    }

    public void setShipStatus(String shipStatus) {
        this.shipStatus = shipStatus;
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

    public Collection<OrderItem> getItems() {
        return items;
    }

    public void setItems(Collection<OrderItem> items) {
        this.items = items;
    }
}
