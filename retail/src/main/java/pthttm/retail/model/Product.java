package pthttm.retail.model;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Collection;

@Entity
@Table(name="Product")
public class Product {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="detail")
    private String detail;

    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @Column(name = "price", columnDefinition = "money", nullable = false)
    private Long price;

    @Column(name = "image")
    private String linkImage;

   // @Column(name = "category_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    //@Column(name = "unit_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "unit_id")
    private Unit unit;

    //@Column(name = "brand_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;

   /* @Temporal(TemporalType.TIMESTAMP)*/
    @CreationTimestamp
/*    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")*/
    @Column(name="create_at",updatable = false, nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private Collection<OrderItem> orders;

    @OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
    private Collection<ProductNutrient> nutrients;

    public Product( String id){
        this.id=id;
    }
    public Product(String id, String name, String detail, Integer quantity, Long price, String linkImage, Category category, Unit unit, Brand brand, LocalDateTime createAt, boolean flag, Collection<OrderItem> orders, Collection<ProductNutrient> nutrients) {
        this.id = id;
        this.name = name;
        this.detail = detail;
        this.quantity = quantity;
        this.price = price;
        this.linkImage = linkImage;
        this.category = category;
        this.unit = unit;
        this.brand = brand;
        this.createAt = createAt;
        this.flag = flag;
        this.orders = orders;
        this.nutrients = nutrients;
    }

    public Product(){
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public String getLinkImage() {
        return linkImage;
    }

    public void setLinkImage(String linkImage) {
        this.linkImage = linkImage;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
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

    public Collection<OrderItem> getOrders() {
        return orders;
    }

    public void setOrders(Collection<OrderItem> orders) {
        this.orders = orders;
    }

    public Collection<ProductNutrient> getNutrients() {
        return nutrients;
    }

    public void setNutrients(Collection<ProductNutrient> nutrients) {
        this.nutrients = nutrients;
    }
}
