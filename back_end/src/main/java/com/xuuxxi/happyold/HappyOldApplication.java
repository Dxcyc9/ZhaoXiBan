package com.xuuxxi.happyold;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class HappyOldApplication {

    public static void main(String[] args) {
        SpringApplication.run(HappyOldApplication.class, args);
    }

}
