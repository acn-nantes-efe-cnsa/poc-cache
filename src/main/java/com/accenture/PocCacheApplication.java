package com.accenture;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
public class PocCacheApplication {

    public static void main(String[] args) {
        SpringApplication.run(PocCacheApplication.class, args);
    }

}
