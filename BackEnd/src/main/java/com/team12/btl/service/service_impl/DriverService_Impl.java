package com.team12.btl.service.service_impl;

import com.team12.btl.entity.Driver;
import com.team12.btl.repository.DriverRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DriverService_Impl implements GeneralService<Driver> {

    @Autowired
    DriverRepository DriverRepository;

    @Override
    public List<Driver> findAll() {
        return DriverRepository.findAll();
    }

    @Override
    public Driver findById(Integer id) {
        return null;
    }

    @Override
    public Driver create(Driver Driver) {
        return null;
    }

    @Override
    public boolean update(Driver Driver) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
