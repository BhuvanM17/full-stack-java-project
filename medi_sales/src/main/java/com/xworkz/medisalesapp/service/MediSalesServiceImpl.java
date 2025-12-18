package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;
import com.xworkz.medisalesapp.entity.UserEntity;
import com.xworkz.medisalesapp.repository.MediSalesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Objects;

@Slf4j
@Service
public class MediSalesServiceImpl implements MediSalesService{
   @Autowired
   private MediSalesRepository repository;
   @Autowired
   private PasswordEncoder passwordEncoder;
   @Autowired
  private MailService mailService;
    @Override
    public boolean validateAndSave(UserDto userDto) {
        if (repository.checkMail(userDto.getEmail())) {
            return false;
        } else {
            UserEntity entity = new UserEntity();
            userDto.setPassword(passwordEncoder.encode(userDto.getPassword()));
            BeanUtils.copyProperties(userDto, entity);
            entity.setCreatedBy(userDto.getEmail());
            entity.setCreatedDate(LocalDate.now());


            repository.save(entity);
            // mailService.sendRegistrationMessage("Registration", "Thank you for registering welcome to our page" + userDto.getContactPerson(), userDto.getEmail());
            return true;
        }
    }
    @Override
    public UserDto getDtoByEmailAndPassword(String email, String password) {
        UserDto dto=new UserDto();
        UserEntity userEntity=  repository.getDtoByEmail(email);
        UserEntity entity;
        if(userEntity.getEmail()!=null&&passwordEncoder.matches(password, userEntity.getPassword())) {
            System.out.println("get by email" + userEntity);
            BeanUtils.copyProperties(userEntity, dto);
        }
        else {
            entity = repository.getDtoByEmail(email);
            entity.setNoOfAttempts(entity.getNoOfAttempts() + 1);
            entity = repository.update(entity);
            log.info("entity : {}", entity);
            BeanUtils.copyProperties(entity, dto);
        }
        return dto;
    }
    @Override
    public UserDto getDtoByEmail(String eMail) {
        UserDto dto=new UserDto();
        UserEntity userEntity=  repository.getDtoByEmail(eMail);
        BeanUtils.copyProperties(userEntity,dto);
        return dto;
    }

    @Override
    public UserDto update(UserDto dto) {
     UserEntity userEntity = new UserEntity();
        UserDto userDto=new UserDto();
      if(dto.getEmail()!=null){
          BeanUtils.copyProperties(dto,userEntity);
          UserEntity entity=repository.update(userEntity);
          BeanUtils.copyProperties(entity,userDto);
          return userDto;
      }
      else
          return new UserDto();
    }

    @Override
    public boolean updatePasswordByEmail(String email, String newPassword) {
        if (email != null) {
            return repository.updatePasswordByEmail(email,passwordEncoder.encode(newPassword));
        }
        return false;
    }

    @Override
    public UserDto updateWithSeesionDto(UserDto dto, UserDto sessionDto) {
        UserEntity entity = new UserEntity();
        BeanUtils.copyProperties(dto, entity);
        entity.setPassword(sessionDto.getPassword());
        entity.setUpdatedBy(sessionDto.getContactPerson());
        entity.setUpdatedDate(LocalDate.now());
        entity.setCreatedBy(sessionDto.getCreatedBy());
        entity.setCreatedDate(sessionDto.getCreatedDate());
        entity.setOtp(sessionDto.getOtp());
        UserEntity entity1 =repository.update(entity);
        UserDto userDto = new UserDto();
        BeanUtils.copyProperties(entity1,userDto);
        return userDto;
    }

    @Override
    public boolean validateOtp(String email, String otp) {
        boolean isValid =false;
        UserEntity userEntity=  repository.getDtoByEmail(email);

        if(passwordEncoder.matches(otp, userEntity.getOtp())) {
            userEntity.setNoOfAttempts(0);
            repository.update(userEntity);
            isValid=true;
        }
        return isValid;
    }

    @Override
    public UserDto getDtoByCustomername(String customerName) {
        UserDto dto=new UserDto();
        UserEntity entity=  repository.getEntityByCustomername(customerName);
        BeanUtils.copyProperties(entity,dto);
        return dto;
    }


}
