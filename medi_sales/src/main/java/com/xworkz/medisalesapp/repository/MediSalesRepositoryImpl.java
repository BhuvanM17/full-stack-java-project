package com.xworkz.medisalesapp.repository;

import com.xworkz.medisalesapp.dto.UserDto;
import com.xworkz.medisalesapp.entity.DistributorEntity;
import com.xworkz.medisalesapp.entity.UserEntity;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

@Repository
@Slf4j
public class MediSalesRepositoryImpl implements MediSalesRepository{
    @Autowired
    private EntityManagerFactory entityManagerFactory;
    @Override
    public boolean checkMail(String email) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNamedQuery("checkEmail").setParameter("email", email);
            UserEntity present = (UserEntity) query.getSingleResult();
            return present!=null;
        }catch (Exception e){
            log.error(e.getMessage());
        }
        return false;
    }

    @Override
    public boolean save(UserEntity entity) {
        log.info("in repo{}",entity);
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        entityManager.persist(entity);
        entityManager.getTransaction().commit();
        entityManager.close();
        return true;
    }

    @Override
    public UserEntity getDtoByEmail(String email) {
        List<UserEntity> results = entityManagerFactory.createEntityManager()
                .createNamedQuery("getAllDetailsByEmail", UserEntity.class)
                .setParameter("email", email)
                .getResultList();
        System.out.println(results);
        if (results.isEmpty()) {
            return new UserEntity();
        }

        return results.get(0);
    }

    @Override
    public UserEntity update(UserEntity user) {
        EntityManager entityManager= entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        UserEntity entity1= entityManager.merge(user);
        entityManager.getTransaction().commit();
        entityManager.close();
        return entity1;
    }

    @Override
    public boolean updatePasswordByEmail(String email, String password) {
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        entityManager.getTransaction().begin();
        int i=  entityManager.createNamedQuery("updatePasswordByEmail").setParameter("pass",password).setParameter("email",email).executeUpdate();
        UserEntity entity=getDtoByEmail(email);
        entity.setUpdatedBy(email);
        entity.setUpdatedDate(LocalDate.now());
        entityManager.getTransaction().commit();
        entityManager.close();
        return i > 0;
    }

    @Override
    public boolean checkPhone(String phone) {
        try {
            EntityManager entityManager = entityManagerFactory.createEntityManager();
            Query query = entityManager.createNamedQuery("checkPhone").setParameter("phone", phone);
            UserEntity present = (UserEntity) query.getSingleResult();
            log.info("present {}",present);
            return present!=null;
        }catch (Exception e){
            log.info(e.getMessage());
        }
        return false;
    }

    @Override
    public List<UserEntity> getAllUsers() {
        return entityManagerFactory.createEntityManager()
                .createQuery("SELECT d FROM UserEntity d", UserEntity.class)
                .getResultList();
    }

    @Override
    public UserEntity getEntityByCustomername(String customerName) {
        return (UserEntity) entityManagerFactory.createEntityManager()
                .createQuery("select u FROM UserEntity u WHERE u.contactPerson = :contactPerson")
                .setParameter("contactPerson",customerName).getSingleResult();
    }


}
