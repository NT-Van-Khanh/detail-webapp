package com.pthttm.retail.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

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

}
