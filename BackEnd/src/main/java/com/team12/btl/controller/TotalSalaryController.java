package com.team12.btl.controller;

import com.team12.btl.entity.TotalSalary;
import com.team12.btl.service.service_impl.TotalSalaryService_Imp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/totalSalary")
public class TotalSalaryController {
    @Autowired
    TotalSalaryService_Imp totalSalaryService;

    @GetMapping("/search/{month}/{year}")
    public ResponseEntity<?> findTotalSalaryByMonthAndYear(@PathVariable Integer month, @PathVariable Integer year){
//        String[] s = date.split("/");
        return ResponseEntity.ok(totalSalaryService.findTotalSalaryByMonthAndYear(month, year));
    }

    @GetMapping("/currentMonthSalary/{month}/{year}")
    public ResponseEntity<?> getCurrentMonthSalary(@PathVariable Integer month, @PathVariable Integer year){
        return ResponseEntity.ok(totalSalaryService.getCurrentMonthSalary(month, year));

    }
    @PostMapping("/saveToDB")
    public ResponseEntity<?> createMonthTotalSalary(@RequestBody List<TotalSalary> totalSalary) {
        return ResponseEntity.ok(totalSalaryService.saveToDB(totalSalary));
    }
}
