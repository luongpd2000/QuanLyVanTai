package com.team12.btl.service.service_impl;

import com.team12.btl.entity.CoachTurn;
import com.team12.btl.entity.Complexity;
import com.team12.btl.entity.Route;
import com.team12.btl.repository.CoachTurnRepository;
import com.team12.btl.repository.ComplexityRepository;
import com.team12.btl.repository.RouteRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class CoachTurnService_Impl implements GeneralService<CoachTurn> {
    @Autowired
    CoachTurnRepository coachTurnRepository;
    @Autowired
    ComplexityRepository complexityRepository;
    @Autowired
    RouteRepository routeRepository;

    @Override
    public List<CoachTurn> findAll() {
        return coachTurnRepository.findCoachTurnByActiveIsTrue();
    }

    @Override
    public CoachTurn findById(Integer id) {
        return coachTurnRepository.findCoachTurnByIdAndActiveIsTrue(id);
    }

    @Override
    public CoachTurn create(CoachTurn coachTurn) {
        Route route = routeRepository.findByIdAndActiveTrue(coachTurn.getRoute().getId());
        Complexity complexity = complexityRepository.getById(route.getComplexity());
        coachTurn.setGradeSalary(complexity.getGradeSalary());
        coachTurn.setActive(true);
        return coachTurnRepository.save(coachTurn);
    }

    @Override
    public CoachTurn update(CoachTurn coachTurn) {
        Route route = routeRepository.findByIdAndActiveTrue(coachTurn.getRoute().getId());
        Complexity complexity = complexityRepository.getById(route.getComplexity());
        coachTurn.setGradeSalary(complexity.getGradeSalary());
        coachTurn.setActive(true);
        return coachTurnRepository.save(coachTurn);
    }

    @Override
    public int delete(Integer id) {
        return coachTurnRepository.deleteCoachTurn(id);
    }

    public List<CoachTurn> searchCoachTurn(Map<String,String> map){
        return coachTurnRepository.searchCoachTurn(
                map.get("ticketPriceMin") !=null ? map.get("ticketPriceMin") : ""
                , map.get("driverName") !=null ? map.get("driverName") : ""
                , map.get("coachPlate") !=null ? map.get("coachPlate") : ""
                , map.get("routeId") !=null ? map.get("routeId") : ""
                );
    }

}
