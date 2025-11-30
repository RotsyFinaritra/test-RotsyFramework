package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.RequestParam;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class EtudiantController {

    @GetMapping("/etudiant/{id}")
    public String miranaGet(int id) {
        return "Etudiant id azo amin'ny get = " + id;
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

    @PostMapping("/etudiant/save")
    public String savePost(int id, String name) {
        return "Etudiant saved with id: " + id + " and name: " + name;
    }


    @PostMapping("/etudiant/save2")
    public String save2(@RequestParam("id") int idEtudiant,String name) {
        return "Etudiant saved with id: " + idEtudiant + " and name: " + name;
    }
}
