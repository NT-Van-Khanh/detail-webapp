package pthttm.retail.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name="Nutrient")
public class Nutrient {
    @Id
    @Column(name="id",nullable = false)
    private String id;

    @Column(name="name", nullable = false)
    private String name;

    @Column(name="detail")
    private String detail;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "nutrientId",fetch = FetchType.EAGER)
    private Collection<ProductNutrient> products;

}
