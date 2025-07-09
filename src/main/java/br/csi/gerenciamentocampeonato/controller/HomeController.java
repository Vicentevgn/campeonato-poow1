package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.service.HomeService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/home")
public class HomeController {

    private final HomeService homeService = new HomeService();

    @GetMapping
    public String home(HttpSession session, Model model) {
        return homeService.setarAtributos(session, model);
    }
}
