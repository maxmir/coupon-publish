package com.inzningko.manage;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.inzningko.manage")
public class DataPlanManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(DataPlanManageApplication.class, args);
    }

}
