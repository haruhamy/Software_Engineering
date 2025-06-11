package com.javaweb.service;

import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;

public interface AssignmentService {
    void updateAssignment(AssignmentBuildingDTO assignmentBuildingDTO) throws ServiceException;
    void upadateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) throws ServiceException;
}
