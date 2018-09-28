package com.forest.wu;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;



@SpringBootApplication
@MapperScan("com.forest.wu.dao")
public class WuApplication {

    public static void main(String[] args) {
        SpringApplication.run(WuApplication.class, args);
    }
}
