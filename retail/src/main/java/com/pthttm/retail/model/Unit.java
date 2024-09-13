package com.pthttm.retail.model;

import jakarta.persistence.*;

import java.util.Collection;

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

    @OneToMany(mappedBy = "unitId",fetch = FetchType.EAGER)
    private Collection<Product> products;
}
