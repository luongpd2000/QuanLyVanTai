package com.team12.btl.repository;

import com.team12.btl.entity.CoachTurn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

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
    @Query(value = " select c.*, SUM( ct.passenger_amount * ct.ticket_price ) as revenue from coach c, coach_turn ct "+
            "where c.id = ct.coach_id and c.is_active = true and ct.is_active = true "+
            "and ct.start_time >= ?1 "+
            "and ct.end_time <= ?2 " + "group by c.id",nativeQuery = true)
    List<Map> getRevenueGroupByCoachID(String startTime, String endTime);
    @Query(value = "select ct.* from coach_turn ct, coach c "+
           "WHERE ct.is_active = 1 "+
           "and c.id = ?1 "+
           "and ct.start_time >= ?2 "+
           "and ct.end_time <= ?3", nativeQuery = true)
    List<CoachTurn> getListCoachTurnByIdCoach(String Id, String startTime, String endTime);
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
//    WHERE ct.is_active = 1 AND ct.start_time >= '2021-12-03 16:20:42'
//    AND ct.end_time <= '2021-12-20 15:20:43'

}