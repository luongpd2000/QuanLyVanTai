package com.team12.btl.service.service_impl;

import com.team12.btl.entity.CoachTurn;
import com.team12.btl.service.GeneralService;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CoachTurnService_Impl implements GeneralService<CoachTurn> {
    @Override
    public List<CoachTurn> findAll() {
        return null;
    }

    @Override
    public CoachTurn findById(Integer id) {
        return null;
    }

    @Override
    public CoachTurn create(CoachTurn CoachTurn) {
        return null;
    }

    @Override
    public boolean update(CoachTurn CoachTurn) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
