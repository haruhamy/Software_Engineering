package com.javaweb.model.request;

import com.javaweb.model.dto.AbstractDTO;
import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.NotBlank;

@Getter
@Setter
public class CustomerSearchRequest extends AbstractDTO {
    private String fullName;
    private String phone;
    private String email;
    private String companyName;
    private String demand;
    private Long is_active=1L;
    private String status;
    private Long staffId;
}
