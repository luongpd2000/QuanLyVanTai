package com.team12.btl.repository;

import com.team12.btl.entity.Route;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface RouteRepository extends JpaRepository<Route, Integer>, JpaSpecificationExecutor<Route> {

//    List<Route> findByActiveIsTrue();
    List<Route> findByActiveIsTrue();
    Route findByIdAndActiveTrue(Integer id);

    @Modifying
    @Query(value = "UPDATE route SET is_active = 0 WHERE Id = ?1",nativeQuery = true)
    int deleteRoute(Integer Id);

    @Query(value="SELECT r.* FROM route r where r.is_active = true AND UPPER(r.point_of_departure) like CONCAT('%',UPPER(?1),'%') " +
            "AND UPPER(r.destination) like CONCAT('%',UPPER(?2),'%') " +
            "AND (CONCAT(r.length, '') LIKE %?3%)" +
            "AND (CONCAT(r.complexity_id, '') LIKE %?4%)" , nativeQuery = true)
    List<Route> searchRoute(String pointOfDeparture, String destination, String length, String complexityId);
}