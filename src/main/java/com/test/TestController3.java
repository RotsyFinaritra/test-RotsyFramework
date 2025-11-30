package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class TestController3 {
    @PostMapping("/mirana/{id}")
    public String miranaPost(int id) {
        return "Mirana jtm post" + " id = " + id;
    }

    // @GetMapping("/mirana/{id}")
    // public String miranaGet(int id) {
    //     return "Mirana jtm get" + " id = " + id;
    // }

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
