package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.AssignmentService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/assigments")
public class AssignmentAPI {
    @Autowired
    private AssignmentService assignmentService;
    @PostMapping("/building")
    public ResponseEntity updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        try {
            assignmentService.updateAssignment(assignmentBuildingDTO);
        }catch (Exception e){
            responseDTO.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(responseDTO);
        }
        responseDTO.setMessage("Success");
        return ResponseEntity.ok().body(responseDTO);
    }

    @PostMapping("/customer")
    public ResponseEntity updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        ResponseDTO responseDTO = new ResponseDTO();
        try {
            assignmentService.upadateAssignmentCustomer(assignmentCustomerDTO);
        }catch (Exception e){
            responseDTO.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(responseDTO);
        }
        responseDTO.setMessage("Success");
        return ResponseEntity.ok().body(responseDTO);
    }
}
