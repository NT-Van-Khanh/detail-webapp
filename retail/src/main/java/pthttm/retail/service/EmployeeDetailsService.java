package pthttm.retail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pthttm.retail.model.CustomerDetails;
import pthttm.retail.model.Employee;
import pthttm.retail.model.EmployeeDetails;

@Service
public class EmployeeDetailsService implements UserDetailsService {
    @Autowired
    private EmployeeService employeeService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Employee employee = null;
        if(username.contains("@")){
            employee = employeeService.getByEmail(username);
        }else{
            employee = employeeService.getByPhone(username);
        }
        if (employee ==null)
            throw new UsernameNotFoundException("Sai số điện thoại hoặc email");

        return new EmployeeDetails(employee);
    }
}
