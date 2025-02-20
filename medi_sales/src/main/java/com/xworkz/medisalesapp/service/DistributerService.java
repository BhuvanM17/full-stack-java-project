package com.xworkz.medisalesapp.service;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface DistributerService {
    boolean validateAndSave(DistributorDto dto, UserDto sessionDto);

    List<DistributorDto> getAllProductsStocks();

    DistributorDto getDistributorDtoByProductName(String productName);

    List<DistributorDto> getAllProductsStocksByEmail(String email);

    void pdfGenerate(List<DistributorDto> dtos,UserDto userDto,Double finalAmount,UserDto dto);
}
