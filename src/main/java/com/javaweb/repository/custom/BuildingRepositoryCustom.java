package com.javaweb.repository.custom;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingRepositoryCustom {
    List<BuildingEntity> findBuildings(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    int countBuildings(BuildingSearchRequest buildingSearchRequest);
}
