package com.pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
@Table(name="Employee")
public class Employee {
    @Id
    @Column(name ="id")
    private String id;

    @Column(name="last_name")
    private String lastName;//ho va ten dem

    @Column(name="first_name", nullable = false)
    private String firstName;//ten

    @Column(name="phone", nullable = false)
    private String phone;

    @Column(name="email", nullable = false)
    private String email;

    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    @Column(name="birthday")
    private LocalDate birthday;

    @Column(name="gender")
    private String gender;

    @Column(name="address")
    private String address;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")
    @Column(name="create_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

}
