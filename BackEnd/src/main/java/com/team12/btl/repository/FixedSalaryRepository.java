package com.team12.btl.repository;

import com.team12.btl.entity.FixedSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface FixedSalaryRepository extends JpaRepository<FixedSalary, Integer>, JpaSpecificationExecutor<FixedSalary> {

}