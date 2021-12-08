package com.team12.btl.service.service_impl;

import com.team12.btl.entity.User;
import com.team12.btl.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {

    @Autowired
    UserRepository userRepository;

    public User update(User user){



        return userRepository.save(user);
    }

    public User getInfoByUserName(String username){
        return userRepository.findUserByUsername(username).get();
    }
}
