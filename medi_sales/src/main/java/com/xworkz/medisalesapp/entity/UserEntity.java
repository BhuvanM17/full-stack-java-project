package com.xworkz.medisalesapp.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "med_pharma")
@Data
@ToString
@NamedQueries({ @NamedQuery(name = "getAllDetailsByEmail",query = "select entity from UserEntity entity where entity.email=:email"),
        @NamedQuery(name = "updatePasswordByEmail",query = "UPDATE UserEntity e SET e.password = :pass WHERE e.email = :email"),
        @NamedQuery(name = "checkEmail",query = "select e from UserEntity e where e.email=:email"),
        @NamedQuery(name = "checkPhone",query = "select u from UserEntity u where u.mobile=:phone")
})
public class UserEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "Company_name")
    private String companyName;
    @Column(name = "Contact_Person")
    private String contactPerson;
    @Column(name = "Business_Type")
    private String businessType;
    @Column(name = "Registered_Mobile")
    private String mobile;
    @Column(name = "Registered_Email")
    private String email;
    @Column(name = "Address")
    private String address;
    @Column(name = "Password")
    private String password;
    @Column(name = "no_of_logins")
    private int noOfLogins;
    @Column(name = "no_of_attempts")
    private int noOfAttempts;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "created_by")
    private String createdBy;
    @Column(name = "updated_by")
    private String updatedBy;
    @Column(name = "updated_date")
    private LocalDate updatedDate;
    private String otp;


}
