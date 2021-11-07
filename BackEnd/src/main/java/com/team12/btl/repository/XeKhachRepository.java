package com.team12.btl.repository;

import com.team12.btl.entity.XeKhach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface XeKhachRepository extends JpaRepository<XeKhach, Integer>, JpaSpecificationExecutor<XeKhach> {

}