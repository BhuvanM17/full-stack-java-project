package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;
import com.xworkz.medisalesapp.entity.UserEntity;
import com.xworkz.medisalesapp.repository.DistributerRepository;
import com.xworkz.medisalesapp.repository.MediSalesRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
public class AjaxServiceImpl implements AjaxService {
   @Autowired
  private MediSalesRepository repository;
   @Autowired
   private MailService mailService;
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private DistributerRepository distributerRepository;

    @Override
    public String checkEmail(String email) {
        boolean isExists = repository.checkMail(email);
        if(isExists)
            return "Email Already Exists";

        return "Email does not exists";
    }

    @Override
    public String checkPhone(String phone) {
        boolean isExists = repository.checkPhone(phone);
        if(isExists)
            return "PhoneNumber Already Exists";

        return "PhoneNumber does not exists";
    }

    @Override
    public String sendOtp(String email) {
       UserEntity userEntity= repository.getDtoByEmail(email);
       if(userEntity.getEmail()!=null){
           Random random = new Random();
           Integer otp = random.nextInt(9999);
           log.info("###################################################");
           log.info("OTP FOR {} IS :: {}", email, otp);
           log.info("###################################################");
           
           // mailService.sendRegistrationMessage("OTP Verification","Dear"+ userEntity.getContactPerson()+" YOUR OTP FOR VERIFICATION ::  "+otp,email);
           
           userEntity.setOtp(passwordEncoder.encode(otp.toString()));
           userEntity=repository.update(userEntity);
           return "OTP Sent Successfully";
       }else return "User not found";
    }

    @Override
    public List<DistributorDto> getProducts(){
        List<DistributorEntity> entities = distributerRepository.getAllDistributors();
        List<DistributorDto> dto = new ArrayList<>();


        for (DistributorEntity entity : entities) {
            DistributorDto distributorDto = new DistributorDto();
            BeanUtils.copyProperties(entity, distributorDto);
            dto.add(distributorDto);
        }

        return dto;
    }

    @Override
    public List<UserDto> getUser() {
        List<UserEntity> entities = repository.getAllUsers();
        List<UserDto> dto = new ArrayList<>();

        for (UserEntity entity : entities) {
            UserDto userDto = new UserDto();
            BeanUtils.copyProperties(entity, userDto);
            dto.add(userDto);
        }

        return dto;
    }

    @Override
    public int getStockByProduct(String productName) {
        return distributerRepository.getStockByProduct(productName);
    }
}
