package com.test;

import java.util.Map;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.RequestParam;
import com.etu003184.annotation.Session;
import com.etu003184.model.ModelView;

@Controller
public class SessionController {

    @GetMapping("/sessions/form")
    public ModelView form(@Session Map<String, Object> sessionMap) {
        // Affiche le contenu actuel de la session
        // (vu que SessionMap est "backed", sessionMap contient les attributs HttpSession)
        System.out.println("Session actuelle dans controller: " + sessionMap);
        return new ModelView("session-form.jsp", sessionMap);
    }

    @PostMapping("/sessions/save")
    public ModelView save(
            @Session Map<String, Object> sessionMap,
            @RequestParam("key") String key,
            @RequestParam("value") String value
    ) {
        // Ecrit directement dans la HttpSession
        sessionMap.put(key, value);

        ModelView mv = new ModelView("session-form.jsp");
        mv.getData().put("message", "Ajouté en session: " + key + " = " + value);
        mv.getData().put("session", sessionMap); // optionnel si tu veux l'afficher dans la JSP
        return mv;
    }

    @PostMapping("/sessions/remove")
    public ModelView remove(
            @Session Map<String, Object> sessionMap,
            @RequestParam("key") String key
    ) {
        // Supprime aussi dans la HttpSession
        sessionMap.remove(key);

        ModelView mv = new ModelView("session-form.jsp");
        mv.getData().put("message", "Supprimé de la session: " + key);
        mv.getData().put("session", sessionMap);
        return mv;
    }
}