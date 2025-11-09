package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class TestController3 {
    @UrlMapping("/mirana")
    public String mirana() {
        return "Mirana jtm";
    }

    @UrlMapping("/mlay")
    public ModelView testModelView() {
        ModelView modelView = new ModelView("mlay.jsp");
        return modelView;
    }
}
