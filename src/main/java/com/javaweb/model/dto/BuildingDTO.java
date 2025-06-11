package com.javaweb.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Getter
@Setter
public class BuildingDTO extends AbstractDTO{
    private Long id;
    @NotBlank(message = "Name can not be blank")
    private String name;

    @NotBlank(message = "Street can not be blank")
    private String street;

    @NotBlank(message = "Ward can not be blank")
    private String ward;

    @NotBlank(message = "District can not be blank")
    private String district;

    @Min(value = 1,message = "Min=1")
    private Long numberOfBasement;
    private Long floorArea;
    private String level;

    @Size(min = 1, message = "TypeCode not null")
    private List<String> typeCode;
    private String overtimeFee;
    private String electricityFee;
    private  String waterFee;
    private String deposit;
    private String payment;
    private String rentTime;
    private String decorationTime;
    private String rentPriceDescription;
    private String carFee;
    private String motoFee;
    private String structure;
    private String direction;
    private String note;

    @NotBlank(message = "Rent Area is required")
    private String rentArea;
    private String managerName;
    private String managerPhone;

    @NotNull(message = "Rent Price is required")
    @Min(value = 1, message = "Rent Price min = 1")
    private Long rentPrice;
    private String serviceFee;
    private double brokerageFee;
    private String image;
    private String imageBase64;
    private String imageName;
}