package com.test;

import com.etu003184.annotation.UrlMapping;

public class TestUrlMapping {
    
    @UrlMapping("/mahafinaritra")
    public String test1() {
        return "test1";
    }

}
