package com.team12.btl.service.service_impl;

import com.team12.btl.entity.DoPhucTap;
import com.team12.btl.repository.DoPhucTapRepository;
import com.team12.btl.repository.TaiXeRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DoPhucTapService_Impl implements GeneralService<DoPhucTap>{

    @Autowired
    DoPhucTapRepository doPhucTapRepository;

    @Override
    public List<DoPhucTap> findAll() {
        return doPhucTapRepository.findAll();
    }

    @Override
    public DoPhucTap findById(Integer id) {
        return null;
    }

    @Override
    public DoPhucTap create(DoPhucTap doPhucTap) {
        return null;
    }

    @Override
    public boolean update(DoPhucTap doPhucTap) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
