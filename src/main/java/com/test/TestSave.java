package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class TestSave {

    @UrlMapping("/dept/save")
    public String save(int id, String name) {
        return "Dept saved with id: " + id + " and name: " + name;
    }
}
