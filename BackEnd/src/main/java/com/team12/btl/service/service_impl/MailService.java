package com.team12.btl.service.service_impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class MailService {
    @Autowired
    private JavaMailSender javaMailSender;

    public boolean sendEmail(String email, String subject, String text){
        SimpleMailMessage msg = new SimpleMailMessage();

        msg.setTo(email);
        msg.setSubject(subject);
        msg.setText(text);

        javaMailSender.send(msg);
        return true;
    }
}
