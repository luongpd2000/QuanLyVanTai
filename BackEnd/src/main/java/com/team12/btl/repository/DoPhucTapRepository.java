package com.team12.btl.repository;

import com.team12.btl.entity.DoPhucTap;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface DoPhucTapRepository extends JpaRepository<DoPhucTap, Integer>, JpaSpecificationExecutor<DoPhucTap> {

}