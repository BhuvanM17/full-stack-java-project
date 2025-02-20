package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.constant.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class MailServiceImpl implements MailService{

    @Autowired
    JavaMailSender javaMailSender;

    @Override
    public boolean sendRegistrationMessage(String subject, String body, String email) {
        MimeMessagePreparator preparator = mimeMessage -> {
            MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
            messageHelper.setFrom(Constants.FROM_EMAIL.getPath(),"bhuvan");
            messageHelper.addTo(email);
            messageHelper.setSubject(subject);
            messageHelper.setText(body);
        };
        javaMailSender.send(preparator);
        return true;
    }
}
