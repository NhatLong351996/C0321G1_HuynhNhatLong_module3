package model.repository;

import model.bean.users.Customer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryIpml implements CustomerRepository {
    @Override
    public List<Customer> selectAllCustomerList() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from khachhang");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("IDKhachHang");
                    String name = resultSet.getString("HoTen");
                    String date = resultSet.getString("NgaySinh");
                    String card = resultSet.getString("SoCMND");
                    String phone = resultSet.getString("SDT");
                    String email = resultSet.getString("Email");
                    String adress = resultSet.getString("DiaChi");
                    customerList.add(new Customer(id, name, date, card, phone, email, adress));
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }

        return customerList;
    }

    @Override
    public void addNewCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("insert into khachhang" +
                        "(IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi) value (?,?,?,?,?,?,?)");
                preparedStatement.setInt(1, customer.getTypeCustomer());
                preparedStatement.setString(2, customer.getNamePerson());
                preparedStatement.setString(3, customer.getDateOfBirth());
                preparedStatement.setString(4, customer.getIdentityNumber());
                preparedStatement.setString(5, customer.getPhoneNumber());
                preparedStatement.setString(6, customer.getEmail());
                preparedStatement.setString(7, customer.getAdress());
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
    }

    @Override
    public Customer getCustomerById(int id) throws SQLException {
        Customer customer = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from khachhang " +
                        "where IDKhachHang=?");
                preparedStatement.setInt(1, id);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()){
                    String name = resultSet.getString("HoTen");
                    String date = resultSet.getString("NgaySinh");
                    String card = resultSet.getString("SoCMND");
                    String phone = resultSet.getString("SDT");
                    String email = resultSet.getString("Email");
                    String adress = resultSet.getString("DiaChi");
                    customer = new Customer(id,name,date,card,phone,email,adress);
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                resultSet.close();
                preparedStatement.close();
                DBConnection.close();
            }
        }
        return customer;
    }

    @Override
    public void updateCustomer(Customer customer) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection!=null){
            try {
                preparedStatement =connection.prepareStatement("update khachhang " +
                        "set IDLoaiKhach=?,HoTen=?,NgaySinh=?,SoCMND=?,SDT=?,Email=?,DiaChi=? " +
                        "where IDKhachHang=?");
                preparedStatement.setInt(1, customer.getTypeCustomer());
                preparedStatement.setString(2,customer.getNamePerson());
                preparedStatement.setString(3,customer.getDateOfBirth());
                preparedStatement.setString(4,customer.getIdentityNumber());
                preparedStatement.setString(5,customer.getPhoneNumber());
                preparedStatement.setString(6,customer.getEmail());
                preparedStatement.setString(7,customer.getAdress());
                preparedStatement.setInt(8,customer.getId());
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
    }

    @Override
    public void deleteCustomer(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection!=null){
            try {
                preparedStatement = connection.prepareStatement("delete from khachhang" +
                        " where IDKhachHang =?");
                preparedStatement.setInt(1,id);
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                preparedStatement.close();
                DBConnection.close();
            }
        }
    }

    @Override
    public List<Customer> searchCustomerByName(String name) {
        List<Customer> list= new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet =null;
        if (connection!=null){
            try {
                preparedStatement=connection.prepareStatement("select * from khachhang where HoTen =?");
                preparedStatement.setString(1,name);
              resultSet =  preparedStatement.executeQuery();
              while (resultSet.next()){
                  int id =resultSet.getInt("IDKhachHang");
                  String _name = resultSet.getString("HoTen");
                  String date = resultSet.getString("NgaySinh");
                  String card = resultSet.getString("SoCMND");
                  String phone = resultSet.getString("SDT");
                  String email = resultSet.getString("Email");
                  String adress = resultSet.getString("DiaChi");
                  list.add(new Customer(id,_name,date,card,phone,email,adress));
              }
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                DBConnection.close();
            }
        }
        return list;
    }
}

