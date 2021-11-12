package com.inzningko.manage;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(scanBasePackages = "com.inzningko.manage")
@MapperScan(basePackages = "com.inzningko.manage.**.mapper")
public class CouponPublishApplication {
    public static void main(String[] args) {
        SpringApplication.run(CouponPublishApplication.class, args);
    }
}

/*
public class CouponPublishApplication extends SpringBootServletInitializer {
    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(CouponPublishApplication.class);
        application.run(args);
    }
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(CouponPublishApplication.class);
    }
}
*/
