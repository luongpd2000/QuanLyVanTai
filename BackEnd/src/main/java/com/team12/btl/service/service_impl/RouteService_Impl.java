package com.team12.btl.service.service_impl;

import com.team12.btl.entity.Route;
import com.team12.btl.repository.RouteRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class RouteService_Impl implements GeneralService<Route> {

    @Autowired
    RouteRepository routeRepository;

    @Override
    public List<Route> findAll() {
        return routeRepository.findAll();
    }

    @Override
    public Route findById(Integer id) {
        return routeRepository.getById(id);
    }


    @Override
    public Route create(Route route) {
        return routeRepository.save(route);
    }

    @Override
    public boolean update(Route route) {
        routeRepository.save(route);
        return true;
    }

    @Override
    public boolean delete(Integer id) {
        routeRepository.deleteById(id);
        return true;
    }
}
