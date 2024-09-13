package com.pthttm.retail.model;

import jakarta.persistence.*;

@Entity
@Table(name="Product_nutrient")
public class ProductNutrient {

    @Id
    @Column(name="id")
    private String id;

    //@Column(name = "product_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product productId;

    //@Column(name = "nutrient_id", nullable = false)
    @ManyToOne
    @JoinColumn(name = "nutrient_id")
    private Nutrient nutrientId;

    @Column(name="flag", nullable = false)
    private boolean flag;
}
