package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class TransactionDTO extends AbstractDTO {
    private Long id;
    @NotBlank(message = "Code not be blank")
    private String code;
    @NotBlank(message = "Note not be blank")
    private String note;
    @NotBlank(message = "Customer id not be blank")
    private Long customerId;
}
