package model.repository;

import model.bean.User;


import java.math.BigDecimal;
import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class UserRepositoryImpl implements UserRepository{

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        if (connection!=null){
            try {
                callableStatement = connection.prepareCall("CALL insert_user(?,?,?) ");
                callableStatement.setString(1, user.getName());
                callableStatement.setString(2, user.getEmail());
               callableStatement.setString(3, user.getCountry());
                callableStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }finally {
                callableStatement.close();
            }
            DBConnection.close();
        }
    }

    @Override
    public User selectUser(int id) throws SQLException {
        User user = null;
        Connection connection = DBConnection.getConnection();
        CallableStatement callableStatement = null;
        ResultSet rs = null;
        if (connection!=null){
            try {
               callableStatement  = connection.prepareCall("CALL get_user_by_id(?) ");
                callableStatement.setInt(1, id);
                 rs= callableStatement.executeQuery();
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
                callableStatement.close();
            }
        }
        DBConnection.close();
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
        DBConnection.close();
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
        DBConnection.close();
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
        DBConnection.close();
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
DBConnection.close();
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
        DBConnection.close();
        return users;
    }

    @Override
    public void addUserTransaction(User user, int[] permisions) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        PreparedStatement pstmtAssignment = null;
        ResultSet resultSet = null;
        if (connection!=null) {
            try {
                connection.setAutoCommit(false);
                preparedStatement = connection.prepareStatement("INSERT INTO users(name, email, country) " +
                                "VALUES (?, ?, ?)",
                        Statement.RETURN_GENERATED_KEYS);
                preparedStatement.setString(1, user.getName());

                preparedStatement.setString(2, user.getEmail());

                preparedStatement.setString(3, user.getCountry());
                int rowAffected = preparedStatement.executeUpdate();
                resultSet= preparedStatement.getGeneratedKeys();
                int userId = 0;
                if (resultSet.next())
                    userId = resultSet.getInt(1);
                if (rowAffected == 1) {
                    pstmtAssignment = connection.prepareStatement("INSERT INTO user_permision(user_id,permision_id) " +
                            "VALUES(?,?)");
                    for (int permisionId : permisions) {
                        pstmtAssignment.setInt(1, userId);
                        pstmtAssignment.setInt(2, permisionId);
                        pstmtAssignment.executeUpdate();
                    }
                    connection.commit();
                }else connection.rollback();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                try {
                    resultSet.close();
                    preparedStatement.close();
                } catch (SQLException throwables) {
                    throwables.printStackTrace();
                }
            }
        }
        DBConnection.close();
    }

    @Override
    public void insertUpdateWithoutTransaction() {
        Connection connection =DBConnection.getConnection();
        PreparedStatement psDrop = null;
        PreparedStatement psCreate = null;
        PreparedStatement psInsert = null;
        PreparedStatement psUpdate = null;

        if (connection!=null){
            try {
                psDrop = connection.prepareStatement("DROP TABLE IF EXISTS EMPLOYEE");
                psDrop.executeUpdate();
                psCreate = connection.prepareStatement("CREATE TABLE EMPLOYEE (" +
                        "ID serial," +
                        "NAME varchar(100) NOT NULL," +
                        "SALARY numeric(15, 2) NOT NULL," +
                        "CREATED_DATE timestamp," +
                        "PRIMARY KEY (ID))");
                psCreate.executeUpdate();
                psInsert = connection.prepareStatement("INSERT INTO EMPLOYEE (NAME, SALARY, CREATED_DATE)" +
                        " VALUES (?,?,?)");
                psInsert.setString(1, "Quynh");

                psInsert.setBigDecimal(2, new BigDecimal(10));

                psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));
                psInsert.executeUpdate();

                psInsert.setString(1, "Ngan");

                psInsert.setBigDecimal(2, new BigDecimal(20));

                psInsert.setTimestamp(3, Timestamp.valueOf(LocalDateTime.now()));

                psInsert.executeUpdate();
                psUpdate = connection.prepareStatement("UPDATE EMPLOYEE SET SALARY=? WHERE NAME=?");
                psUpdate.setBigDecimal(2, new BigDecimal(999.99));
                psUpdate.setString(2, "Quynh");
                psUpdate.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }
}
