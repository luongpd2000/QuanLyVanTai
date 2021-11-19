package com.team12.btl.repository;

import com.team12.btl.entity.TotalSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TotalSalaryRepository extends JpaRepository<TotalSalary, Integer>, JpaSpecificationExecutor<TotalSalary> {

}