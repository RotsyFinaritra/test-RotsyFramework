package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.RequestParam;
import com.etu003184.annotation.UrlMapping;
import com.etu003184.model.ModelView;

@Controller
public class EtudiantController {

    @UrlMapping("/etudiant/form")
    public ModelView form() {
        return new ModelView("etudiant-form.jsp");
    }

    @UrlMapping("/etudiant/form2")
    public ModelView form2() {
        return new ModelView("etudiant-form2.jsp");
    }

    @UrlMapping("/etudiant/save")
    public String save(int id, String name) {
        return "Etudiant saved with id: " + id + " and name: " + name;
    }

    @UrlMapping("/etudiant/save2")
    public String save2(@RequestParam("id") int idEtudiant,String name) {
        return "Etudiant saved with id: " + idEtudiant + " and name: " + name;
    }
}
