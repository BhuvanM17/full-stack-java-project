package com.xworkz.medisalesapp.constant;

import lombok.Getter;

@Getter
public enum Constants {
    PROFILE_PHOTO_PATH("E://project//medi-sales-profile-photos/"),FROM_EMAIL("bhuvanshetty317@gmail.com"),PASSWORD("fjhz obvj haix yxvy");

    private  String path;

    Constants(String path){
        this.path =path;
    }

}
