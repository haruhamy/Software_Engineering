package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class CustomerDTO extends AbstractDTO{
    private Long id;
    @NotBlank(message = "Họ và tên không được thiếu")
    private String fullName;
    @NotBlank(message = "Số điện thoại không được thiếu")
    private String phone;
    private String email;
    private String demand;
    private String status;
    private String companyName;
    private long staffId;
}
