package com.team12.btl.service.service_impl;

import com.team12.btl.entity.Complexity;
import com.team12.btl.repository.ComplexityRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComplexityService_Impl implements GeneralService<Complexity>{

    @Autowired
    ComplexityRepository ComplexityRepository;

    @Override
    public List<Complexity> findAll() {
        return ComplexityRepository.findAll();
    }

    @Override
    public Complexity findById(Integer id) {
        return null;
    }

    @Override
    public Complexity create(Complexity Complexity) {
        return null;
    }

    @Override
    public boolean update(Complexity Complexity) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
