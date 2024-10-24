package pthttm.retail.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Employee;
@Repository
public interface EmployeeRepository extends CrudRepository<Employee,String> {
}
