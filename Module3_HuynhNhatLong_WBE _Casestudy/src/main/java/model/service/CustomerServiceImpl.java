package model.service;

import model.bean.users.Customer;
import model.repository.CustomerRepository;
import model.repository.CustomerRepositoryIpml;

import java.sql.SQLException;
import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    CustomerRepository customerRepository = new CustomerRepositoryIpml();
    @Override
    public List<Customer> selectAllCustomerList() {
        return customerRepository.selectAllCustomerList();
    }

    @Override
    public void addNewCustomer(Customer customer) throws SQLException {
        customerRepository.addNewCustomer(customer);
    }

    @Override
    public Customer getCustomerById(int id) throws SQLException {
        return customerRepository.getCustomerById(id);
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        customerRepository.updateCustomer(customer);
    }

    @Override
    public void deleteCustomer(int id) throws SQLException {
        customerRepository.deleteCustomer(id);
    }

    @Override
    public List<Customer> searchCustomerByName(String name) {
       return customerRepository.searchCustomerByName(name);
    }
}
