package com.team12.btl.repository;

import com.team12.btl.entity.TotalSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;
import java.util.Optional;

public interface TotalSalaryRepository extends JpaRepository<TotalSalary, Integer>, JpaSpecificationExecutor<TotalSalary> {

    List<TotalSalary> findTotalSalaryByMonthAndYear(Integer month, Integer year);

}