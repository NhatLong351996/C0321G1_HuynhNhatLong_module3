package model.service;

import model.bean.User;


import java.sql.SQLException;
import java.util.List;

public interface UserService {

    public void insertUser(User user) throws SQLException;

    public User selectUser(int id) throws SQLException;

    public List<User> selectAllUsers() throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;
    public User selectUserByName(String _name) throws SQLException;
    public List<User> sortedListByName() throws SQLException;
}
