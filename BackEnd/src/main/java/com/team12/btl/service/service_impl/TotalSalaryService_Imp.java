package com.team12.btl.service.service_impl;

import com.team12.btl.entity.TotalSalary;
import com.team12.btl.repository.TotalSalaryRepository;
import com.team12.btl.service.GeneralService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(rollbackFor = Exception.class)
public class TotalSalaryService_Imp {
    @Autowired
    TotalSalaryRepository totalSalaryRepository;

    public List<TotalSalary> findTotalSalaryByMonthAndYear(Integer month, Integer year){
       return totalSalaryRepository.findTotalSalaryByMonthAndYear(month,year);
    }
}
