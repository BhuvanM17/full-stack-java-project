package com.xworkz.medisalesapp.repository;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;

import java.util.List;

public interface DistributerRepository {
    boolean saveProduct(DistributorEntity entity);

    List<DistributorEntity> getAllProducts();

    List<DistributorEntity> getAllDistributors();


    int getStockByProduct(String productName);

    DistributorEntity getDistributorDtoByProductName(String productName);

    List<DistributorEntity> getAllProductsStocksByEmail(String email);
}
