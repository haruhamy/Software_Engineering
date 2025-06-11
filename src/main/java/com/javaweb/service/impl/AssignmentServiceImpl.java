package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class AssignmentServiceImpl implements AssignmentService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO) throws ServiceException {
        BuildingEntity buildingEntity=buildingRepository.findBuildingEntityById(assignmentBuildingDTO.getBuildingId());
        if(buildingEntity==null){
            throw new ServiceException("Building not found ");
        }
        List<UserEntity> userEntities=userRepository.findAllById(assignmentBuildingDTO.getStaffs());
        buildingEntity.setUsers(userEntities);
        buildingRepository.save(buildingEntity);
    }

    @Override
    public void upadateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) throws ServiceException {
        CustomerEntity customerEntity=customerRepository.findCustomerEntitiesById(assignmentCustomerDTO.getCustomerId());
        if(customerEntity==null){
            throw new ServiceException("Customer not found ");
        }
        List<UserEntity> userEntities=userRepository.findAllById(assignmentCustomerDTO.getStaffs());
        customerEntity.setUsers(userEntities);
        customerRepository.save(customerEntity);
    }
}
