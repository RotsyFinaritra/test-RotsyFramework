package com.test;

import java.util.Arrays;
import java.util.Map;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.RequestParam;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class EtudiantController {

    @GetMapping("/etudiant/{id}")
    public String miranaGet(int id, String name, @RequestParam("age") String ageEtd) {
        return "Etudiant id azo amin'ny get = " + id + " sy name = " + name + " ary age = " + ageEtd;
    }

    @PostMapping("/etudiant/{id}")
    public String miranaPost(int id) {
        return "Etudiant id azo amin'ny post = " + id;
    }

    @GetMapping("/etudiant/form")
    public ModelView form() {
        return new ModelView("etudiant-form.jsp");
    }

    @UrlMapping("/etudiant/form2")
    public ModelView form2() {
        return new ModelView("etudiant-form2.jsp");
    }

    @PostMapping("/etudiant/save/{id}")
    public String savePost(
            int id,
            Map<String, Object> params,
            @RequestParam("age") int age,
            String name) {

        StringBuilder result = new StringBuilder("Params received:\n");

        for (Map.Entry<String, Object> entry : params.entrySet()) {
            result.append(entry.getKey()).append(" : ");

            Object value = entry.getValue();

            // Si c'est un tableau (ce qui est le cas)
            if (value instanceof String[]) {
                result.append(Arrays.toString((String[]) value));
            } else {
                result.append(value);
            }

            result.append(", ");
        }

        return result + "\n----- Etudiant saved with id: " + id +
                " , name: " + name +
                " , age: " + age;
    }

    @PostMapping("/etudiant/save2")
    public String save2(@RequestParam("id") int idEtudiant, String name) {
        return "Etudiant saved with id: " + idEtudiant + " and name: " + name;
    }
}
