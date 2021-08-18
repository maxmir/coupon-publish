package com.inzningko.manage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.inzningko.manage")
@MapperScan(basePackages = "com.inzningko.manage.**.mapper")
public class DataPlanManageApplication {
    public static void main(String[] args) {
        SpringApplication.run(DataPlanManageApplication.class, args);
    }
}
