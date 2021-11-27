package com.team12.btl.controller;

import com.team12.btl.service.service_impl.DriverService_Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/driver")
public class DriverController {

    @Autowired
    DriverService_Impl driverService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() throws Exception {
        return ResponseEntity.ok(driverService.findAll());
    }

}
