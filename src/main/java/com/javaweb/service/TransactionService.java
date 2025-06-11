package com.javaweb.service;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface TransactionService {
    List<TransactionEntity> getTransactionByCodeAndCustomerId(String code, Long customerId);
    TransactionEntity createOrUpdateTransaction(TransactionDTO transactionDTO) throws RuntimeException;
    void deleteTransactionById(Long id);
}
