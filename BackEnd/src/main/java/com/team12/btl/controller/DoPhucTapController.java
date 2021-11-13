package com.team12.btl.controller;

import com.team12.btl.service.service_impl.DoPhucTapService_Impl;
import com.team12.btl.service.service_impl.TaiXeService_Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/do_phuc_tap")
public class DoPhucTapController {

    @Autowired
    DoPhucTapService_Impl doPhucTapService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(doPhucTapService.findAll());
    }
}
