package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class TestController3 {
    @UrlMapping("/mirana/{id}")
    public String mirana(int id) {
        return "Mirana jtm" + " id = " + id;
    }

    @UrlMapping("/mlay")
    public ModelView testModelView() {
        ModelView modelView = new ModelView("mlay.jsp");
        String[] depts = {"Info", "RH"};
        String[] emps = {"Mario", "Mirana"};
        modelView.addData("listDept", depts);
        modelView.addData("listEmp", emps);
        return modelView;
    }
}
