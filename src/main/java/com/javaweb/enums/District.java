package com.javaweb.enums;
import java.util.LinkedHashMap;
import java.util.Map;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3"),
    QUAN_4("Quận 4"),
    QUAN_5("Quận 5"),
    QUAN_TD("Quận Thủ Đức");
    private String districtName;
    District(String districtName) {
        this.districtName = districtName;
    }
    public String getDistrictName() {
        return districtName;
    }
    public static Map<String,String> getDistrict(){
        Map<String,String> district=new LinkedHashMap<>();
        for(District it:District.values()){
            district.put(it.toString(),it.getDistrictName());
        }
        return district;
    }
}
