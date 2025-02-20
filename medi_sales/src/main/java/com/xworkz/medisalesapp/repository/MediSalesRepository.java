package com.xworkz.medisalesapp.repository;

import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.UserEntity;

import java.util.List;

public interface MediSalesRepository {
    boolean checkMail(String email);

    boolean save(UserEntity entity);

    UserEntity getDtoByEmail(String email);

    UserEntity update(UserEntity user);


    boolean updatePasswordByEmail(String email, String password);

    boolean checkPhone(String phone);

    List<UserEntity> getAllUsers();

    UserEntity getEntityByCustomername(String customerName);
}
