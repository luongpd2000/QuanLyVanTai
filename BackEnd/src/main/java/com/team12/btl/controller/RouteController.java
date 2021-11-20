package com.team12.btl.controller;

import com.team12.btl.entity.Route;
import com.team12.btl.service.service_impl.RouteService_Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1/route/")
@CrossOrigin(origins = {"http://localhost:4200"})
public class RouteController {
    @Autowired
    RouteService_Impl routeService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll() {
        return ResponseEntity.ok(routeService.findAll());
    }

    @GetMapping("/findById/{id}")
    public ResponseEntity<?> findById(@PathVariable Integer id) {
        return ResponseEntity.ok(routeService.findById(id));
    }

    @PostMapping("/create")
    public ResponseEntity<?> createRoute(@Valid @RequestBody Route route) {
        return ResponseEntity.ok(routeService.create(route));
    }

    @DeleteMapping("/deleteById/{id}")
    public ResponseEntity<?> deleteById(@PathVariable Integer id) {
        return ResponseEntity.ok(routeService.delete(id));
    }
}
