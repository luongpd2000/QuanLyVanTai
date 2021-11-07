package com.team12.btl.repository;

import com.team12.btl.entity.ChuyenXe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface ChuyenXeRepository extends JpaRepository<ChuyenXe, Integer>, JpaSpecificationExecutor<ChuyenXe> {

}