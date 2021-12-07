package com.team12.btl.repository;

import com.team12.btl.entity.TotalSalary;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface TotalSalaryRepository extends JpaRepository<TotalSalary, Integer>, JpaSpecificationExecutor<TotalSalary> {

    List<TotalSalary> findTotalSalaryByMonthAndYear(Integer month, Integer year);

//    @Query(value = "call ltw.currentMonthSalary(?1, ?2);", nativeQuery = true)
//    @Query(value = "select d.name as driver_name,d.id as driver_id, month(ct.start_time) as month, year(ct.start_time) as year," +
//            "sum( if( ct.driver_id = d.id, " +
//            "ct.ticket_price*ct.passenger_amount*ct.grade_salary*2, " +
//            "ct.ticket_price*ct.passenger_amount*ct.grade_salary) " +
//            "+ fs.basic_salary*fs.grade) as total " +
//            "from coach_turn ct, driver d, fixed_salary fs " +
//            "where (ct.driver_id = d.id or ct.driver_asistant_id = d.id) " +
//            "and d.fixed_salary_id = fs.id " +
//            "and month(ct.start_time) = ?1 and year(ct.start_time) = ?2 " +
//            "group by d.id " +
//            "order by d.id ", nativeQuery = true)
//    List<Map> getCurrentMonthSalary(Integer month, Integer year);



    @Modifying
    @Query(value = "DROP TEMPORARY TABLE IF EXISTS temp;" +
            "CREATE TEMPORARY TABLE temp AS " +
            "   select d.name as driver_name, d.id as driver_id, month(ct.end_time) as month, year(ct.end_time) as year," +
            "   sum( if( ct.driver_id = d.id, " +
            "   ct.ticket_price*ct.passenger_amount*ct.grade_salary*2/100, " +
            "   ct.ticket_price*ct.passenger_amount*ct.grade_salary/100) + fs.basic_salary*fs.grade) as total " +
            "   from coach_turn ct, driver d, fixed_salary fs " +
            "   where (ct.driver_id = d.id or ct.driver_asistant_id = d.id) " +
            "   and d.fixed_salary_id = fs.id " +
            "   and month(ct.end_time) = ?1 and year(ct.end_time) = ?2 " +
            "   group by d.id; " +
            "DROP TEMPORARY TABLE IF EXISTS temp2; " +
            "CREATE TEMPORARY TABLE temp2 AS " +
            "   select d.name as driver_name, d.id as driver_id, 12 as month, 2021 as year, fs.basic_salary*fs.grade as total " +
            "   from driver d, fixed_salary fs  where d.fixed_salary_id = fs.id " +
            "   and d.id not in(select temp.driver_id from temp );" +
            "insert into temp (driver_name,driver_id,month,year,total)  select * from temp2;" +
            "select * from temp ORDER BY temp.driver_id;", nativeQuery = true)
    List<Map> getCurrentMonthSalary(Integer month, Integer year);

}