package com.team12.btl.service.service_impl;

import com.team12.btl.entity.TaiXe;
import com.team12.btl.repository.TaiXeRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaiXeService_Impl implements GeneralService<TaiXe> {

    @Autowired
    TaiXeRepository taiXeRepository;

    @Override
    public List<TaiXe> findAll() {
        return taiXeRepository.findAll();
    }

    @Override
    public TaiXe findById(Integer id) {
        return null;
    }

    @Override
    public TaiXe create(TaiXe taiXe) {
        return null;
    }

    @Override
    public boolean update(TaiXe taiXe) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }
}
