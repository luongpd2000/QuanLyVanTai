package com.team12.btl.controller;

import com.team12.btl.service.service_impl.TaiXeService_Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/tai_xe")
public class TaiXeController {

    @Autowired
    TaiXeService_Impl taiXeService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(taiXeService.findAll());
    }

}
