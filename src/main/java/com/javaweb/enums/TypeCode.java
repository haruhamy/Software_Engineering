package com.javaweb.enums;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public enum TypeCode {
    TANG_TRET("Tầng trệt"),
    NGUYEN_CAN("Nguyên Căn"),
    NOI_THAT("Nội Thất");
    private String typeName;
    TypeCode(String typeName) {
        this.typeName = typeName;
    }
    public String getTypeName() {
        return typeName;
    }
    public static Map<String,String> getType() {
        Map<String,String> map = new LinkedHashMap<>();
        for (TypeCode type : TypeCode.values()) {
            map.put(type.toString(), type.typeName);
        }
        return map;
    }
}
