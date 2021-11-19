package com.team12.btl.repository;

import com.team12.btl.entity.Coach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CoachRepository extends JpaRepository<Coach, Integer>, JpaSpecificationExecutor<Coach> {

}