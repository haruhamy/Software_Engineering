package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.exception.ServiceException;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> buildingSearch(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    BuildingEntity createOrUpdateBuilding(BuildingDTO buildingDTO);
    BuildingDTO findByIḍ(Long id);
    void deleteBuilding(List<Long> ids);
    int countTotalItems(BuildingSearchRequest buildingSearchRequest);
    boolean isStaffOfBuilding(Long staffId, Long buildingId);
}
