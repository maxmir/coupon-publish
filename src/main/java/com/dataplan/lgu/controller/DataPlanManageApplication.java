package com.dataplan.lgu.controller;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.dataplan.lgu")
public class DataPlanManageApplication {

    public static void main(String[] args) {
        SpringApplication.run(DataPlanManageApplication.class, args);
    }

}
