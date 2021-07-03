package model.repository;

import model.bean.User;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository{

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = DBConnection.getConnection();
        if (connection!=null){
            try {

                PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO users(name, email, country) " +
                        "VALUES(?, ?, ?);");
                preparedStatement.setString(1, user.getName());
                preparedStatement.setString(2, user.getEmail());
                preparedStatement.setString(3, user.getCountry());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    @Override
    public User selectUser(int id) throws SQLException {
        User user = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        if (connection!=null){
            try {
               preparedStatement  = connection.prepareStatement("select id,name,email,country " +
                        "from users where id =?");
                preparedStatement.setInt(1, id);
                 rs= preparedStatement.executeQuery();
                while (rs.next()) {
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    user = new User(id, name, email, country);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                rs.close();
                preparedStatement.close();
            }
        }
        return user;
    }



    @Override
    public List<User> selectAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs=null;
        if (connection!=null){
            try {
                preparedStatement = connection.prepareStatement("select * from users");
                 rs= preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    users.add(new User(id, name, email, country));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                rs.close();
                preparedStatement.close();
            }

        }
        return users;
    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection!=null){
            try {
                preparedStatement= connection.prepareStatement("delete from users " +
                        "where id = ?;");
                preparedStatement.setInt(1,id);
                rowDeleted = preparedStatement.executeUpdate()>0;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                preparedStatement.close();
            }
        }
        return rowDeleted;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean rowUpdated = false;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection!=null){
            try {
             preparedStatement = connection.prepareStatement("update users " +
                    "set name = ?,email= ?, country =? where id = ?;");
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.setInt(4,user.getId());
            rowUpdated = preparedStatement.executeUpdate()>0;
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                preparedStatement.close();
            }
        }
        return rowUpdated;
    }

    @Override
    public User selectUserByName(String _name) {
        User user = null;
        PreparedStatement preparedStatement =null;
        ResultSet rs =null;
        Connection connection = DBConnection.getConnection();
        if (connection!=null){
            try {
                preparedStatement = connection.prepareStatement("select * from users " +
                        "where name =? ");
                preparedStatement.setString(1,_name);
                rs = preparedStatement.executeQuery();
                while (rs.next()){
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    user= new User(id, name, email, country);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                try {
                    rs.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
                try {
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }

        return user;
    }

    @Override
    public List<User> sortedListByName() throws SQLException {
        List<User> users = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet rs=null;
        if (connection!=null){
            try {
                preparedStatement = connection.prepareStatement("select * from users order by name ;");
                rs= preparedStatement.executeQuery();
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String country = rs.getString("country");
                    users.add(new User(id, name, email, country));
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                rs.close();
                preparedStatement.close();
            }
        }
        return users;
    }
}
