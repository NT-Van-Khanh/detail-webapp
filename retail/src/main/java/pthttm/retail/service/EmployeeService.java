package pthttm.retail.service;

import org.springframework.stereotype.Service;
import pthttm.retail.model.Employee;
import pthttm.retail.repository.EmployeeRepository;

@Service
public class EmployeeService {
    private final EmployeeRepository employeeRepository;


    public EmployeeService(EmployeeRepository employeeRepository) {
        this.employeeRepository = employeeRepository;
    }

    public Employee getEmployeeById(String id){
        return employeeRepository.findById(id).orElse(null);
    }
}
