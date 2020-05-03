package com.funtl.spring.security.oauth2.server.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;

@org.springframework.boot.test.context.SpringBootTest
@RunWith(SpringRunner.class)
public class SpringBootTest{

    @Test
    public void test(){
        System.out.println(new BCryptPasswordEncoder().encode("123456"));
    }

}