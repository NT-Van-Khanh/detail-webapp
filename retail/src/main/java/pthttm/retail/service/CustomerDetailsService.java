package pthttm.retail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import pthttm.retail.model.Customer;
import pthttm.retail.model.CustomerDetails;

@Service
public class CustomerDetailsService implements UserDetailsService {

    @Autowired
    private CustomerService customerService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Customer customer = customerService.getByEmailOrPhone(username);
        if(customer==null)
            throw new UsernameNotFoundException("Sai số điện thoại hoặc email.");

        return new CustomerDetails(customer);
    }

    public Customer getAuthenticatedCustomer() {
        try {
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null || !authentication.isAuthenticated())
                return null;

            Object principal = authentication.getPrincipal();
            if (principal instanceof CustomerDetails) {
                return ((CustomerDetails) principal).getCustomer();
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
