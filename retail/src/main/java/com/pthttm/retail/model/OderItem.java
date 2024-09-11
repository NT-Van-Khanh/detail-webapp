package com.pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Entity
@Table(name="Oder_item")
public class OderItem {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="oder_id",nullable = false)
    private String oderId;

    @Column(name="product_id",nullable = false)
    private  String productId;

    @Column(name="quantity",nullable = false)
    private Integer quantity;

    @Column(name="total_cost", columnDefinition = "money", nullable = false)
    private  Long totalCost;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;


}
