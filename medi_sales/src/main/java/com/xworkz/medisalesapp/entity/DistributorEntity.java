package com.xworkz.medisalesapp.entity;

import lombok.Data;
import lombok.ToString;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Table(name = "distributor_table")
@Data
@ToString
@NamedQuery(name = "getAllStockDetails" , query = "from DistributorEntity entity")
public class DistributorEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "product_company")
    private String productCompany;
    @Column(name = "product_name")
    private String productName;
    @Column(name = "HSN")
    private String hsn;
    @Column(name = "mrp")
    private String mrp;
    @Column(name = "pack")
    private String pack;
    @Column(name = "batch_no")
    private String batchNo;
    @Column(name = "mfg_date")
    private String mfgDate;
    @Column(name = "exp_date")
    private String expDate;
    @Column(name = "quantity")
    private Integer quantity;
    @Column(name = "rate")
    private Double rate;
    private Double gst;
    @Column(name = "discount")
    private Double discount;
    @Column(name = "created_date")
    private LocalDate createdDate;
    @Column(name = "created_by")
    private String created_by;
    @Column(name = "update_by")
    private String updatedBy;
    @Column(name = "update_date")
    private LocalDate updatedDate;


}
