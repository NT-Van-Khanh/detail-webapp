package pthttm.retail.model;

import jakarta.persistence.*;

import java.util.Collection;

@Entity
@Table(name="Brand")
public class Brand {

    @Id
    @Column(name="id")
    private String id;

    @Column(name="name",nullable = false)
    private String name;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "brandId",fetch =  FetchType.EAGER)
    private Collection<Product> products;
}
