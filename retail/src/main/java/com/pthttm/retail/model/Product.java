package com.pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

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

    @Column(name = "category_id", nullable = false)
    private  String categoryId;

    @Column(name = "unit_id", nullable = false)
    private  String unitId;

    @Column(name = "brand_id", nullable = false)
    private String brandId;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;
}
