package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;

@Controller
public class TestController3 {
    @UrlMapping("/mirana")
    public String mirana() {
        return "Hello from TestController3";
    }
}
