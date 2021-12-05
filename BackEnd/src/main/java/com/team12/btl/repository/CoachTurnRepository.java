package com.team12.btl.repository;

import com.team12.btl.entity.CoachTurn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CoachTurnRepository extends JpaRepository<CoachTurn, Integer>, JpaSpecificationExecutor<CoachTurn> {
    List<CoachTurn> findCoachTurnByActiveIsTrue();

    CoachTurn findCoachTurnByIdAndActiveIsTrue(Integer Id);

    @Modifying
    @Query(value = "UPDATE coach_turn SET is_active = 0 WHERE Id = ?1", nativeQuery = true)
    int deleteCoachTurn(Integer Id);

    @Query(value = "select ct.* from coach_turn ct, driver d, coach c, route r "+
            "where ct.is_active=true and ct.driver_id=d.id and ct.coach_id=c.id and ct.route_id=r.id " +
            "and ct.ticket_price >= ?1 " +
            "and upper(d.name) like concat('%',upper(?2),'%') " +
            "and upper(c.plate) like concat('%',upper(?3),'%') " +
            "and upper(r.id) like concat('%',upper(?4),'%')",nativeQuery = true)
    List<CoachTurn> searchCoachTurn(String ticketPriceMin, String driverName, String coachPlate, String routeId);

//    SELECT
//    c.*,
//    SUM( ct.passenger_amount * ct.ticket_price ) revenue
//    FROM
//    coach c,
//    coach_turn ct
//    WHERE
//    c.id = ct.coach_id AND c.is_active = 1 AND ct.is_active = 1
//    GROUP BY
//    c.id
//
//
//    SELECT ct.*
//    FROM
//    coach_turn ct
//    WHERE ct.is_active = 1	AND ct.start_time >= '2021-12-03 16:20:42'
//    AND ct.end_time <= '2021-12-20 15:20:43'

}