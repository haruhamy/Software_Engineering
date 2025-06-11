package com.javaweb.api.admin;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.CustomerService;
import com.javaweb.service.impl.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/customers")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @PostMapping
    public ResponseEntity<?> createOrUpdateCustomer(@Valid @RequestBody CustomerDTO customerDTO, BindingResult bindingResult) {
        try {
            if(bindingResult.hasErrors()) {
                List<String> allErrors = bindingResult.getFieldErrors().stream()
                                        .map(FieldError::getDefaultMessage)
                                        .collect(Collectors.toList());
                return ResponseEntity.badRequest().body(allErrors);
            }
            ResponseDTO responseDTO = customerService.createOrUpdateCustomer(customerDTO);
            return ResponseEntity.ok(responseDTO);
        }catch (Exception e) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(responseDTO);
        }
    }
    @DeleteMapping("/{ids}")
    public ResponseEntity<?> deleteCustomer(@PathVariable List<Long> ids) {
        if(ids.size()==0){
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Ids can not be empty");
            return ResponseEntity.badRequest().body(responseDTO);
        }else{
            customerService.deleteCustomer(ids);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Customers deleted successfully");
            return ResponseEntity.ok(responseDTO);
        }
    }
    @GetMapping("/{customerId}/staffs")
    public ResponseEntity<?> getStaff(@PathVariable Long customerId) {
        return ResponseEntity.ok().body(customerService.getStaff(customerId));
    }
}
