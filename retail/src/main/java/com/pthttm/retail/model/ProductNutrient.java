package com.pthttm.retail.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Product_nutrient")
public class ProductNutrient {

    @Id
    @Column(name="id")
    private String id;

    @Column(name = "product_id", nullable = false)
    private String productId;

    @Column(name = "nutrient_id", nullable = false)
    private String nutrientId;

    @Column(name="flag", nullable = false)
    private boolean flag;
}
