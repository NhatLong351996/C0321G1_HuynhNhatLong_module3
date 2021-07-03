package model.repository;

import model.bean.Produce;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProduceRepositoryImpl implements ProduceRepository {


    @Override
    public List<Produce> selectAllProduce() throws SQLException {
        List<Produce> produceList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("SELECT * FROM produces;");
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String name = resultSet.getString("name");
                    int price = resultSet.getInt("price");
                    String descripe = resultSet.getString("description");
                    String producer = resultSet.getString("producer");
                    Produce produce = new Produce(id, name, price, descripe, producer);
                    produceList.add(produce);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                resultSet.close();
                preparedStatement.close();
            }
        }
        return produceList;
    }

    @Override
    public void insertProduce(Produce produce) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("insert into produces(name,price,description,producer)" +
                        "value (?,?,?,?)");
                preparedStatement.setString(1, produce.getName());
                preparedStatement.setInt(2, produce.getPrice());
                preparedStatement.setString(3, produce.getDescription());
                preparedStatement.setString(4, produce.getProducer());
                preparedStatement.executeUpdate();
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                preparedStatement.close();
            }
        }
    }

    @Override
    public void editProduce(Produce produce) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("update produces " +
                        "set name = ?, price=?,description=?,producer=? " +
                        "where id=?");
                preparedStatement.setString(1, produce.getName());
                preparedStatement.setInt(2, produce.getPrice());
                preparedStatement.setString(3, produce.getDescription());
                preparedStatement.setString(4, produce.getProducer());
                preparedStatement.setInt(5, produce.getId());
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                preparedStatement.close();
            }
        }
    }

    @Override
    public void deleteProduce(int id) throws SQLException {
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("delete from produces where id = ?;");
                preparedStatement.setInt(1, id);
                preparedStatement.executeUpdate();
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                preparedStatement.close();
            }
        }
    }

    @Override
    public Produce selectProduce(int id) throws SQLException {
        Produce produce = null;
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            preparedStatement = connection.prepareStatement("select * from produces where id =?;");
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                int price = resultSet.getInt("price");
                String description = resultSet.getString("description");
                String producer = resultSet.getString("producer");
                produce = new Produce(id, name, price, description, producer);
            }
        }
        return produce;
    }

    @Override
    public List<Produce> findProduce(String _name) throws SQLException {
        List<Produce> produceList = new ArrayList<>();
        Connection connection = DBConnection.getConnection();
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;
        if (connection != null) {
            try {
                preparedStatement = connection.prepareStatement("select * from produces where name = ?;");
                preparedStatement.setString(1, _name);
                resultSet = preparedStatement.executeQuery();
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    int price = resultSet.getInt("price");
                    String description = resultSet.getString("description");
                    String producer = resultSet.getString("producer");
                    Produce produce = new Produce(id, _name, price, description, producer);
                    produceList.add(produce);
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            } finally {
                resultSet.close();
                preparedStatement.close();
            }
        }
        return produceList;
    }
}
