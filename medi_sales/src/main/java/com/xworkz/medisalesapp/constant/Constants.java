package com.xworkz.medisalesapp.constant;

import com.xworkz.medisalesapp.configuration.SpringConfiguration;
import lombok.Getter;

@Getter
public enum Constants {
    PROFILE_PHOTO_PATH(SpringConfiguration.getEnv("PROFILE_PHOTO_PATH") != null ? SpringConfiguration.getEnv("PROFILE_PHOTO_PATH") : "C://project//medi-sales-profile-photos/"),
    FROM_EMAIL(SpringConfiguration.getEnv("MAIL_USERNAME")),
    PASSWORD(SpringConfiguration.getEnv("MAIL_PASSWORD"));

    private String path;

    Constants(String path) {
        this.path = path;
    }
}
