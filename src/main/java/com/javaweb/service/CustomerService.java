package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    ResponseDTO createOrUpdateCustomer(CustomerDTO customerDTO);
    List<CustomerEntity> findCustomer(CustomerSearchRequest request, Pageable pageable);
    int countCustomer(CustomerSearchRequest request);
    ResponseDTO getStaff(Long id);
    void deleteCustomer(List<Long> ids);
    boolean isStaffOfCustomer(Long staffId, Long customerId);
    CustomerDTO findByIdandIsActive(Long id, Integer isActive) throws Exception;
}
