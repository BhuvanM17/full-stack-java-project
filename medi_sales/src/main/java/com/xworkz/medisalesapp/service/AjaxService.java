package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface AjaxService {
    String checkEmail(String email);

    String checkPhone(String phone);



    String sendOtp(String email);

    List<DistributorDto> getProducts();

    List<UserDto> getUser();

    int getStockByProduct(String productName);

    String chatWithAi(String prompt);
}
