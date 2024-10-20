package pthttm.retail.service;

import pthttm.retail.model.Customer;
import pthttm.retail.model.Product;
import pthttm.retail.repository.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerService {

    private final CustomerRepository customerRepository;

    @Autowired
    public CustomerService(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    public List<Customer> getAllCustomer(){
        return customerRepository.findAll();
    }

    public Customer getCustomerById(int customerId){
        return customerRepository.findById(customerId).orElse(null);
    }

}
