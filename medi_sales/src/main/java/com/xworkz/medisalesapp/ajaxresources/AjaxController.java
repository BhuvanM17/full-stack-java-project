package com.xworkz.medisalesapp.ajaxresources;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.service.AjaxService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequestMapping("api/")
@Slf4j
public class AjaxController {
    @Autowired
    private AjaxService ajaxService;


    @GetMapping("checkEmail/{email}")
    public String checkEmailExists(@PathVariable String email){
        log.info("email {}",email);
        return ajaxService.checkEmail(email);
    }

    @GetMapping("checkPhone/{phone}")
    public  String checkPhoneExists(@PathVariable String phone){
        log.info("phone{}",phone);
        return  ajaxService.checkPhone(phone);
    }

    @GetMapping("sendOtp/{email}")
    public  String sendOtp(@PathVariable String email){

        return ajaxService.sendOtp(email);
    }
    @GetMapping("getProducts")
    public List<String> getProducts(Model model){
        List<DistributorDto> distributors = ajaxService.getProducts();

        return distributors.stream()
                .map(DistributorDto::getProductName)
                .collect(Collectors.toList());
    }

    @GetMapping("getCustomer")
    public List<String> getCustomerName(){
        List<UserDto> userDtos = ajaxService.getUser();
        return userDtos.stream()
                .map(UserDto::getContactPerson)
                .collect(Collectors.toList());
    }
    @GetMapping("getStockByProduct")
    public int getStocks(String productName){

        return ajaxService.getStockByProduct(productName);
    }
}
