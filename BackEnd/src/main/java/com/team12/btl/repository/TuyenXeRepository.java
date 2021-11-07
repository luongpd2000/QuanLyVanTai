package com.team12.btl.repository;

import com.team12.btl.entity.TuyenXe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TuyenXeRepository extends JpaRepository<TuyenXe, Integer>, JpaSpecificationExecutor<TuyenXe> {

}