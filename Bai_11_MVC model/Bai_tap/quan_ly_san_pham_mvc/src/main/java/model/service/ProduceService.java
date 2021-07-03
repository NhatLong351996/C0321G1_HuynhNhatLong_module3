package model.service;

import model.bean.Produce;

import java.sql.SQLException;
import java.util.List;

public interface ProduceService {
    public List<Produce> selectAllProduce() throws SQLException;
    public void insertProduce(Produce produce) throws SQLException;
    public void editProduce(Produce produce) throws SQLException;
    public void deleteProduce(int id) throws SQLException;
    public Produce selectProduce(int id) throws SQLException;
    public List<Produce> findProduce(String name) throws SQLException;
}
