package com.xworkz.medisalesapp.dto;

import lombok.*;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Date;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class DistributorDto implements Serializable {

    private Integer id;
    private String productCompany;
    private String productName;
    private String hsn;
    private String mrp;
    private String  pack ;
    private String  batchNo ;
    private String  mfgDate ;
    private String  expDate ;
    private Integer quantity;
    private Double  rate ;
    private Double gst;
    private Double discount;
    private String  created_by;
    private LocalDate createdDate ;
    private String update_by;
    private LocalDate updateDate;
    private Double totalAmount;

}
