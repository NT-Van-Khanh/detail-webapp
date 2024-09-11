package com.pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Oder")
public class Oder {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="user_id", nullable = false)
    private Integer userId;

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
}
