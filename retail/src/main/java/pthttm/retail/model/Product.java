package pthttm.retail.model;

import jakarta.persistence.*;
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
    private Category categoryId;

    //@Column(name = "unit_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "unit_id")
    private Unit unitId;

    //@Column(name = "brand_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "brand_id")
    private Brand brandId;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "productId", fetch = FetchType.EAGER)
    private Collection<OrderItem> orders;

    @OneToMany(mappedBy = "productId", fetch = FetchType.EAGER)
    private Collection<ProductNutrient> nutrients;

}
