package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Component;

import java.util.List;


public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    void deleteByBuildingEntity(BuildingEntity buildingEntity);
    void deleteByBuildingEntity_IdIn(List<Long> ids);
}
