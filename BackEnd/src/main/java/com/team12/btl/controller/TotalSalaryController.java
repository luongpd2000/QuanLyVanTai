package com.team12.btl.controller;

import com.team12.btl.service.service_impl.TotalSalaryService_Imp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/totalSalary")
public class TotalSalaryController {
    @Autowired
    TotalSalaryService_Imp totalSalaryService;

    @GetMapping("/search/{month}/{year}")
    @ResponseBody
    public ResponseEntity<?> findTotalSalaryByMonthAndYear(@PathVariable Integer month, @PathVariable Integer year){
//        String[] s = date.split("/");
        return ResponseEntity.ok(totalSalaryService.findTotalSalaryByMonthAndYear(month, year));
    }
}
