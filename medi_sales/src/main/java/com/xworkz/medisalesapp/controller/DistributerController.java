package com.xworkz.medisalesapp.controller;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.service.DistributerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/")
public class DistributerController {

    @Autowired
    DistributerService service;
    @PostMapping("stock")
    public String createStock(@Valid DistributorDto dto, Model model, HttpServletRequest httpServletRequest){
        UserDto sessionDto = (UserDto) httpServletRequest.getSession().getAttribute("sessionDto");
        log.info("dto is {}",sessionDto);
        service.validateAndSave(dto,sessionDto);
        model.addAttribute("success",dto.getProductName()+" has been added successfully");
        return "createstock";
    }
    @GetMapping("getallstocks")
    public String getAllStocks(Model model,HttpServletRequest httpServletRequest){
        UserDto sessionDto = (UserDto) httpServletRequest.getSession().getAttribute("sessionDto");
        List<DistributorDto> dto= service.getAllProductsStocksByEmail(sessionDto.getEmail());
        log.info("dto-----{}",dto);
        double discountedPrice=0.0;
        double gstAmount = 0.0;
        for (DistributorDto product : dto) {
            discountedPrice = (product.getRate() * product.getQuantity() * product.getDiscount()) / 100;
            gstAmount=(discountedPrice*product.getGst())/100;
            log.info("gst----{}",gstAmount);
        }
        double totalAmount = 0;
            for (DistributorDto product : dto) {
                totalAmount =product.getRate()*product.getQuantity()-discountedPrice+gstAmount;
                model.addAttribute("totalAmount",totalAmount);
                log.info("totalAmount----{}",totalAmount);
            }
        model.addAttribute("stockList",dto);
        return "viewstocks";
    }
    @GetMapping("viewstocks")
    public String getViewStocksPage(){
        return "viewstocks";
    }
    @GetMapping("generatebill")
    public String getGenerateBillPage(){
        return "generatebill";
    }
}
