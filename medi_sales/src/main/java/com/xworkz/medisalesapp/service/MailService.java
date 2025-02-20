package com.xworkz.medisalesapp.service;

public interface MailService {
    boolean sendRegistrationMessage(String subject,String body,String email);
}
