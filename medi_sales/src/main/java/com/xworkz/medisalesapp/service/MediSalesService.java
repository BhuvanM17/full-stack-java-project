package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.UserDto;

public interface MediSalesService {
    boolean validateAndSave(UserDto userDto);

    UserDto getDtoByEmailAndPassword(String email, String password);
     UserDto getDtoByEmail(String eMail);

     UserDto update(UserDto dto);

    boolean updatePasswordByEmail(String email, String newPassword);

    UserDto updateWithSeesionDto(UserDto dto, UserDto sessionDto);

    boolean validateOtp(String email, String otp);

    UserDto getDtoByCustomername(String customerName);
}
