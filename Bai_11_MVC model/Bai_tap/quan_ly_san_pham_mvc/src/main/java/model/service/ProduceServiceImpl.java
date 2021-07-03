package model.service;

import model.bean.Produce;
import model.repository.ProduceRepository;
import model.repository.ProduceRepositoryImpl;

import java.sql.SQLException;
import java.util.List;

public class ProduceServiceImpl implements ProduceService {
    ProduceRepository produceRepository = new ProduceRepositoryImpl();
    @Override
    public List<Produce> selectAllProduce() throws SQLException {
        return produceRepository.selectAllProduce();
    }

    @Override
    public void insertProduce(Produce produce) throws SQLException {
produceRepository.insertProduce(produce);
    }

    @Override
    public void editProduce(Produce produce) throws SQLException {
produceRepository.editProduce(produce);
    }

    @Override
    public void deleteProduce(int id) throws SQLException {
produceRepository.deleteProduce(id);
    }

    @Override
    public Produce selectProduce(int id) throws SQLException {
        return produceRepository.selectProduce(id);
    }

    @Override
    public List<Produce> findProduce(String name) throws SQLException {
        return produceRepository.findProduce(name);
    }
}
