package com.team12.btl.service.service_impl;

import com.team12.btl.entity.User;
import com.team12.btl.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;

@Service
@Transactional(rollbackFor = Exception.class)
public class UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    PasswordEncoder bCryptPasswordEncoder;

    public User update(Map<String, String> data) throws Exception {
        User user1 = userRepository.findUserByUsername(data.get("username")).get();
        if (data.get("password") != null && !data.get("password").equals("")) {
            if (!bCryptPasswordEncoder.encode(data.get("password")).equals(user1.getEncryptedPassword())) {
                throw new Exception("Mật khẩu không đúng");
            }
            user1.setEncryptedPassword(bCryptPasswordEncoder.encode(data.get("newPassword")));
        }
        user1.setEmail(data.get("email")!=null ? data.get("email") : user1.getEmail());
        return userRepository.save(user1);
    }

    public User getInfoByUserName(String username){
        return userRepository.findUserByUsername(username).get();
    }
}
