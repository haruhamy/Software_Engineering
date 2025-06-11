package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/transactions")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;
    @PostMapping
    public ResponseEntity<?> createOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO, BindingResult bindingResult) {
        try {
            if(bindingResult.hasErrors()) {
                List<String> errors = bindingResult.getFieldErrors().stream()
                                    .map(FieldError::getDefaultMessage).collect(Collectors.toList());
                return ResponseEntity.badRequest().body(errors);
            }
            transactionService.createOrUpdateTransaction(transactionDTO);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Transaction created or updated successfully");
            return ResponseEntity.ok(responseDTO);
        }
        catch (Exception e) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage(e.getMessage());
            return ResponseEntity.badRequest().body(responseDTO);
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteTransaction(@PathVariable Long id) {
        if(id == null) {
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Ids can not be empty");
            return ResponseEntity.badRequest().body(responseDTO);
        }else{
            transactionService.deleteTransactionById(id);
            ResponseDTO responseDTO = new ResponseDTO();
            responseDTO.setMessage("Buildings deleted successfully");
            return ResponseEntity.ok(responseDTO);
        }
    }
}
