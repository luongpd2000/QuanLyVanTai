package com.team12.btl.repository;

import com.team12.btl.entity.CoachTurn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface CoachTurnRepository extends JpaRepository<CoachTurn, Integer>, JpaSpecificationExecutor<CoachTurn> {

}