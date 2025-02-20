package com.xworkz.medisalesapp.repository;

import com.xworkz.medisalesapp.dto.DistributorDto;
import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.util.Collections;
import java.util.List;

@Slf4j
@Repository
public class DistributerRepositoryImpl implements DistributerRepository{
    @Autowired
    private EntityManagerFactory entityManagerFactory;

    @Override
    public boolean saveProduct(DistributorEntity entity) {
        log.info("in repo{}",entity);
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
        return true;
    }

    @Override
    public List<DistributorEntity> getAllProducts() {
       return entityManagerFactory.createEntityManager().createNamedQuery("getAllStockDetails").getResultList();
    }

    @Override
    public List<DistributorEntity> getAllDistributors() {
      return entityManagerFactory.createEntityManager()
                .createQuery("SELECT d FROM DistributorEntity d", DistributorEntity.class)
                .getResultList();
    }

    @Override
    public int getStockByProduct(String productName) {
        return (Integer) entityManagerFactory.createEntityManager()
   .createQuery("SELECT d.quantity FROM DistributorEntity d WHERE d.productName = :productName")
                .setParameter("productName",productName).getSingleResult();
    }

    @Override
    public DistributorEntity getDistributorDtoByProductName(String productName) {
        return (DistributorEntity)entityManagerFactory.createEntityManager()
                .createQuery("select d from DistributorEntity d where d.productName = : productName")
                .setParameter("productName",productName).getSingleResult();
    }

    @Override
    public List<DistributorEntity> getAllProductsStocksByEmail(String email) {
        return entityManagerFactory.createEntityManager()
                .createQuery("select d from DistributorEntity d where d.created_by = :email", DistributorEntity.class)
                .setParameter("email", email)
                .getResultList();
    }



}
