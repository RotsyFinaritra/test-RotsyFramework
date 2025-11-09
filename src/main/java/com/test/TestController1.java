package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class TestController1 {

    @UrlMapping("/hello")
    public String hello() {
        return "Hello from TestController1";
    }

    @UrlMapping("/aaa")
    public ModelView testModelView() {
        ModelView modelView = new ModelView("views/aaa.html");
        return modelView;
    }
    
}
