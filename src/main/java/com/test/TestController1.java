package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;

@Controller
public class TestController1 {

    @UrlMapping("/hello")
    public String hello() {
        return "Hello from TestController1";
    }
    
}
