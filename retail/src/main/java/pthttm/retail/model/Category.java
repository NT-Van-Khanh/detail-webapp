package pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Collection;

@Entity
@Table(name="Category")
public class Category {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="name",nullable = false)
    private String name;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "categoryId",fetch = FetchType.EAGER)
    private Collection<Product> products;
}
