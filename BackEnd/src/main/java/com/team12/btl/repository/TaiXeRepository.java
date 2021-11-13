package com.team12.btl.repository;

import com.team12.btl.entity.TaiXe;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TaiXeRepository extends JpaRepository<TaiXe, Integer>, JpaSpecificationExecutor<TaiXe> {
    List<TaiXe> findAll();
}