package com.xworkz.medisalesapp.constant;

import lombok.Getter;

@Getter
public enum Constants {
    PROFILE_PHOTO_PATH(System.getenv("PROFILE_PHOTO_PATH") != null ? System.getenv("PROFILE_PHOTO_PATH") : "C://project//medi-sales-profile-photos/"),
    FROM_EMAIL(System.getenv("MAIL_USERNAME")),
    PASSWORD(System.getenv("MAIL_PASSWORD"));

    private String path;

    Constants(String path) {
        this.path = path;
    }
}
