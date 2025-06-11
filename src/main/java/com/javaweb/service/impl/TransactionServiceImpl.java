package com.javaweb.service.impl;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.TransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.Collections;
import java.util.List;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private TransactionRepository transactionRepository;
    @Override
    public List<TransactionEntity> getTransactionByCodeAndCustomerId(String code, Long customerId) {
        List<TransactionEntity> transactionEntityList=transactionRepository.findTransactionEntityByCodeAndCustomerId(code,customerId);
        return transactionEntityList;
    }


    @Override
    public TransactionEntity createOrUpdateTransaction(TransactionDTO transactionDTO) throws RuntimeException {
        TransactionEntity transactionEntity = modelMapper.map(transactionDTO, TransactionEntity.class);
        return transactionRepository.save(transactionEntity);
    }

    @Override
    public void deleteTransactionById(Long id) {
        transactionRepository.deleteById(id);
    }
}
