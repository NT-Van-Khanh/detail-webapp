package pthttm.retail.model;

import jakarta.persistence.*;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collection;

@Entity
@Table(name="Customer")
public class Customer {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name="id", nullable = false)
    private Integer id;

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

    @Column(name="gender", nullable = true)
    private Boolean gender;

    @Column(name="address")
    private String address;

    @Temporal(TemporalType.TIMESTAMP)
/*    @DateTimeFormat(pattern="HH:mm dd/MM/yyyy")*/
    @Column(name="created_at",nullable = false)
    private LocalDateTime createAt;

    @Column(name="flag",nullable = false)
    private boolean flag;

    @OneToMany(mappedBy = "customer",fetch = FetchType.EAGER)
    private Collection<OrderProduct> orders;

    public Customer() {
    }

    public String getFormattedCreateAt() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm dd/MM/yyyy");
        return createAt.format(formatter);
    }


    public String getGenderAsString() {
        if (gender == null) {
            return "khác";
        }
        return gender ? "nữ" : "nam";
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public Boolean getGender() {
        return gender;
    }

    public void setGender(Boolean gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public boolean isFlag() {
        return flag;
    }

    public void setFlag(boolean flag) {
        this.flag = flag;
    }

    public Collection<OrderProduct> getOrders() {
        return orders;
    }

    public void setOrders(Collection<OrderProduct> orders) {
        this.orders = orders;
    }
}
