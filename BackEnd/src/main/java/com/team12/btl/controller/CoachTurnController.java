package com.team12.btl.controller;


import com.team12.btl.entity.CoachTurn;
import com.team12.btl.service.service_impl.CoachTurnService_Impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import javax.validation.Valid;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/coachTurn")
public class CoachTurnController {
    @Autowired
    CoachTurnService_Impl coachTurnService;

    @GetMapping("/findAll")
    public ResponseEntity<?> findAll(){
        return ResponseEntity.ok(coachTurnService.findAll());
    }

    @GetMapping("/findById/{id}")
    public ResponseEntity<?> findById(@PathVariable Integer id){
        return ResponseEntity.ok(coachTurnService.findById(id));
    }

    @PostMapping("/create")
    public ResponseEntity<?> createCoachTurn(@Valid @RequestBody CoachTurn coachTurn){
        return ResponseEntity.ok(coachTurnService.create(coachTurn));
    }

    @PutMapping("/update")
    public ResponseEntity<?> update(@Valid @RequestBody CoachTurn coachTurn){
        return ResponseEntity.ok(coachTurnService.update(coachTurn));
    }

    @DeleteMapping("/deleteById/{Id}")
    public ResponseEntity<?> deleteById(@PathVariable Integer Id){
        return ResponseEntity.ok(coachTurnService.delete(Id));
    }

    @GetMapping("/search")
    public ResponseEntity<?> search(@RequestParam Map<String,String> param){
        return ResponseEntity.ok(coachTurnService.searchCoachTurn(param));
    }
}