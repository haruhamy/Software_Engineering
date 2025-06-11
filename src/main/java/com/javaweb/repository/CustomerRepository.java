package com.javaweb.repository;

import com.javaweb.entity.CustomerEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerRepository extends JpaRepository<CustomerEntity,Long> {
    CustomerEntity findCustomerEntitiesById(Long id);

    CustomerEntity findCustomerEntitiesByIdAndIsActive(Long id, Integer i);
}
