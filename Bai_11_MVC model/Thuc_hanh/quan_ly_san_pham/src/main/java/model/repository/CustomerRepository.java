package model.repository;

import model.bean.Customer;

import java.util.List;

public interface CustomerRepository {
    List<Customer> findAll();
    void save(Customer customer);
    Customer findById(int id);
    void upDate(int id,Customer customer);
    void reMove(int id);
}
