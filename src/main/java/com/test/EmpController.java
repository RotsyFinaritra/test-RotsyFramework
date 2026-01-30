package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.Json;
import com.etu003184.annotation.PostMapping;
import com.etu003184.entity.Emp;
import com.etu003184.model.ModelView;

@Controller
public class EmpController {

    @PostMapping("/emp/save")
    // @Json
    public ModelView save(Emp[] emp) {
        ModelView modelView = new ModelView("liste-emp.jsp");
        modelView.addData("emps", emp);
        return modelView;
    }

    // @PostMapping("/emp/save")
    // public String save(Emp emp) {
    //     StringBuilder result = new StringBuilder("Emp received:\n");
    //     result.append("ID: ").append(emp.getId()).append("\n");
    //     result.append("Name: ").append(emp.getName()).append("\n");

    //     result.append("Departments:\n");
    //     if (emp.getDept() != null) {
    //         for (Dept dept : emp.getDept()) {
    //             result.append(" - Dept ID: ").append(dept.getId())
    //                   .append(", Dept Name: ").append(dept.getName()).append("\n");
    //         }
    //     } else {
    //         result.append(" No departments assigned.\n");
    //     }

    //     return result.toString();
    // }

    @GetMapping("/emp/form")
    public ModelView form() {
        return new ModelView("emp-form2.jsp");
    }
}
