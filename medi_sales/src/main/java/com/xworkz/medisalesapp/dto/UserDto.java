package com.xworkz.medisalesapp.dto;

import lombok.*;

import javax.persistence.Column;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDate;

@ToString
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class UserDto implements Serializable {

    private Integer id;
    @NotNull(message="company name shouldn't be null")
    @Size(min = 2, max = 25,message = "Should be min 2 char and max 25")
    private String companyName;
    @NotNull(message="Contact Person shouldn't be null")
    @Size(min = 2, max = 25,message = "Should be min 2 char and max 25")
    private String contactPerson;
    @NotNull(message="business type shouldn't be null")
    @Size(min = 2, max = 25,message = "Should be min 2 char and max 25")
    private String businessType;
    @Pattern(regexp = "^\\d{10}$", message = "Contact should be a valid 10-digit number")
    private String mobile;
    @NotNull(message = "Email shouldn't be null")
    @Size(min = 3, max = 50, message = "Email should be min 3 chars and max 50")
    private String email;
    @NotNull(message = "address shouldn't be null")
    @Size(min = 3, max = 50, message = "Email should be min 3 chars and max 50")
    private String address;
    @NotNull(message = "Password shouldn't be null")
    @Size(min = 8, max = 20, message = "Password should be min 8 chars and max 20")
    private String password;
    @NotNull(message = "Confirm password shouldn't be null")
    @Size(min = 8, max = 20, message = "Confirm password should be min 8 chars and max 20")
    private String confirmPassword;
    private int noOfAttempts;
    private int noOfLogins;
    private LocalDate createdDate;
    private String createdBy;
    private String updatedBy;
    private LocalDate updatedDate;
    private String otp;

}
