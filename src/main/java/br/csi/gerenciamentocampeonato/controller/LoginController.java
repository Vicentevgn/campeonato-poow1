package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.service.LoginService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    private final LoginService loginService = new LoginService();

    @GetMapping
    public String index(HttpSession session) {
        session.removeAttribute("msg");
        return "index";
    }

    @GetMapping("/login")
    public String login(HttpSession session) {
        session.removeAttribute("msg");
        return "login";
    }

    @PostMapping("/registrar")
    public String registrar(@RequestParam String nome, @RequestParam String email, @RequestParam String senha, HttpSession session) {
        if (nome == null || email == null || senha == null) {
            session.setAttribute("msg", "Preencha todos os campos");
            return "index";
        }
        return loginService.registrar(nome, email, senha, session);
    }

    @PostMapping("/login")
    public String registrar(@RequestParam String email, @RequestParam String senha, HttpSession session) {
        return loginService.autenticar(email, senha, session);
    }
}
