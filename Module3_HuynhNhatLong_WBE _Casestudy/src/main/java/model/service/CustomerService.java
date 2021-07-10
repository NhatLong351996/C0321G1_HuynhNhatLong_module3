package model.service;

import model.bean.users.Customer;

import java.sql.SQLException;
import java.util.List;

public interface CustomerService {
    public List<Customer> selectAllCustomerList();

    void addNewCustomer(Customer customer) throws SQLException;

    Customer getCustomerById(int id) throws SQLException;

    void updateCustomer(Customer customer) throws SQLException;

    void deleteCustomer(int id) throws SQLException;

    List<Customer> searchCustomerByName(String name);
}
