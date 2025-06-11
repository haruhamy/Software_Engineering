package com.javaweb.repository;

import com.javaweb.entity.RoleEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<RoleEntity,Long> {
	RoleEntity findOneByCode(String code);
}
