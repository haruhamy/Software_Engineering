package com.javaweb.repository;

import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long> {
    BuildingEntity findBuildingEntityById(Long id);
    void deleteByIdIn(List<Long> ids);
    List<BuildingEntity> id(Long id);
}