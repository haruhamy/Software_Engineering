package com.javaweb.api.admin;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/buildings")
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<?> createOrUpdateBuildings(@Valid @RequestBody BuildingDTO buildingDTO, BindingResult bindingResult) {
        try {
            if(bindingResult.hasErrors()) {
                System.out.println("failed ");
                List<String> errors = bindingResult.getFieldErrors()
                        .stream().map(FieldError::getDefaultMessage)
                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(errors);
            }
            //xuống repo => service xử lí data
            buildingService.createOrUpdateBuilding(buildingDTO);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Buildings created or updated successfully");
            return ResponseEntity.ok(responseDTO);
        } catch (Exception e) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(responseDTO);
        }
    }

    @DeleteMapping("/{ids}")
    public ResponseEntity<?> deleteBuildings(@PathVariable List<Long> ids) {
        if(ids.size()==0){
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Ids can not be empty");
            return ResponseEntity.badRequest().body(responseDTO);
        }else{
            buildingService.deleteBuilding(ids);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Buildings deleted successfully");
            return ResponseEntity.ok(responseDTO);
        }
    }

    @GetMapping("/{buildingId}/staffs")
    public ResponseEntity<?> loadStaffs(@PathVariable Long buildingId) {
        return ResponseEntity.ok().body(userService.responseStaffDTO(buildingId));
    }
}
