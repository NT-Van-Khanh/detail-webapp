package com.pthttm.retail.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="Unit")
public class Unit {
    @Id
    @Column(name="id")
    private String id;

    @Column(name="name",nullable = false)
    private String name;

    @Column(name="flag",nullable = false)
    private boolean flag;
}
