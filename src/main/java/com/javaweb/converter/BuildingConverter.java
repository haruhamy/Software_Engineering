package com.javaweb.converter;

import com.javaweb.config.ModelMapperConfig;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private BuildingRepository buildingRepository;

    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity ele) {
        BuildingSearchResponse buildingSearchResponse = modelMapper.map(ele, BuildingSearchResponse.class);

        String districtName = (ele.getDistrict() != null && !ele.getDistrict().isEmpty()) ? District.valueOf(ele.getDistrict()).getDistrictName() : "";
        buildingSearchResponse.setAddress(
                (ele.getStreet() != null && !ele.getStreet().isEmpty() ? ele.getStreet() + ", " : "") +
                        (ele.getWard() != null && !ele.getWard().isEmpty() ? ele.getWard() + ", " : "") +
                        districtName
        );

        List<RentAreaEntity> rentAreasEntities = ele.getRentAreas();
        String rentArea = (rentAreasEntities != null && !rentAreasEntities.isEmpty())
                ? rentAreasEntities.stream()
                .map(rae -> rae.getValue() != null ? rae.getValue().toString() : "")
                .collect(Collectors.joining(","))
                : "";

        buildingSearchResponse.setRentArea(rentArea);

        return buildingSearchResponse;
    }

    public BuildingEntity toBuidlingEntity(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
        String type=buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        buildingEntity.setType(type);
        if(buildingDTO.getId()!=null){
            BuildingEntity building=buildingRepository.findById(buildingDTO.getId()).get();
//            buildingEntity.setImage(building.getImage());
        }
        return buildingEntity;
    }

    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
        BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
        List<RentAreaEntity> areaEntities= buildingEntity.getRentAreas();
        String rentArea=areaEntities.stream().map(i->i.getValue().toString()).collect(Collectors.joining(","));
        buildingDTO.setRentArea(rentArea);
        List<String> typeCode= Arrays.stream(buildingEntity.getType().split(",")).collect(Collectors.toList());
        buildingDTO.setTypeCode(typeCode);
        return buildingDTO;
    }
}
