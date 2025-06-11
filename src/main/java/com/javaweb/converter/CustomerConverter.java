package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.Status;
import com.javaweb.model.dto.CustomerDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;
    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO) {
        Status status = Status.valueOf(Status.class,customerDTO.getStatus());
        customerDTO.setStatus(status.getStatusName());
        return modelMapper.map(customerDTO, CustomerEntity.class);
    }

    public CustomerDTO toCustomerDTO(CustomerEntity customerEntity) {
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }
}
