package com.team12.btl.service.service_impl;

import com.team12.btl.entity.Coach;
import com.team12.btl.service.GeneralService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachService_Impl implements GeneralService<Coach> {
    @Override
    public List<Coach> findAll() {
        return null;
    }

    @Override
    public Coach findById(Integer id) {
        return null;
    }

    @Override
    public Coach create(Coach Coach) {
        return null;
    }

    @Override
    public boolean update(Coach Coach) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
