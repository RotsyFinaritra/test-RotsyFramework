package com.test;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.PostMapping;
import com.etu003184.annotation.RequestParam;
import com.etu003184.annotation.Session;
import com.etu003184.model.ModelView;
import java.util.Map;

@Controller
public class LoginController {

	@GetMapping("/login")
	public ModelView loginForm() {
		return new ModelView("login.jsp");
	}

	@PostMapping("/login/validate")
	public ModelView validateLogin(
			@RequestParam("username") String username,
			@RequestParam("password") String password,
			@Session Map<String, Object> sessionMap
	) {
		ModelView mv = new ModelView("liste-emp.jsp");
		// Check statique : username = admin, password = 1234
		if ("admin".equals(username) && "1234".equals(password)) {
			sessionMap.put("user", username);
            sessionMap.put("role", "saisie");
			mv.getData().put("message", "Connexion réussie !");
			mv.getData().put("success", true);
		} else {
            mv.setView("login.jsp");
			mv.getData().put("message", "Identifiants invalides.");
			mv.getData().put("success", false);
		}
		return mv;
	}
}
