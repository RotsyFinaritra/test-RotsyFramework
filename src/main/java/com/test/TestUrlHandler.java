package com.test;

import com.etu003184.annotation.UrlHandler;

public class TestUrlHandler {
    
    @UrlHandler("/mahafinaritra")
    public String test1() {
        return "test1";
    }

}
