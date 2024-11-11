package pthttm.retail.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Employee;

import java.util.Optional;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee,String> {
    Optional<Employee> findByPhone(String phone);
    Optional<Employee> findByEmail(String email);
}
