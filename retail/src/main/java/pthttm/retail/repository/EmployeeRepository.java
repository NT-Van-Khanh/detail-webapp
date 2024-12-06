package pthttm.retail.repository;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Employee;

import java.util.Optional;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee,String> {
    Optional<Employee> findByPhone(String phone);
    Optional<Employee> findByEmail(String email);

    @Query(value = "EXEC getNextEmployeeSequence", nativeQuery = true)
    Integer getNextSequenceValue();
}
