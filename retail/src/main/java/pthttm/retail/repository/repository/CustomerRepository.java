package pthttm.retail.repository.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Customer;

@Repository
public interface CustomerRepository extends JpaRepository<Customer,Integer> {

}
