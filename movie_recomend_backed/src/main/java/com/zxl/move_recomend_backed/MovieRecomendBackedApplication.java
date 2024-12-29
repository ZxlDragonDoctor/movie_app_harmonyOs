package com.zxl.move_recomend_backed;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("com.zxl.move_recomend_backed.mapper")
@SpringBootApplication
public class MovieRecomendBackedApplication {

    public static void main(String[] args) {
        SpringApplication.run(MovieRecomendBackedApplication.class, args);
    }

}
