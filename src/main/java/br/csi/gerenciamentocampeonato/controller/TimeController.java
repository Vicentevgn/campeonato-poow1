package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.service.TimeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/time")
public class TimeController {

    private final TimeService timeService = new TimeService();

    @GetMapping
    public String listarTimes(Model model) {
        return timeService.listarTimes(model);
    }

    @GetMapping("/novo")
    public String novoTime(Model model) {
        return timeService.novaPartida(model);
    }

    @PostMapping("/salvar")
    public String salvarTime(@RequestParam String nome,
                            @RequestParam String cidade,
                            @RequestParam int esporteId) {
        return timeService.salvarTime(nome, cidade, esporteId);
    }

    @GetMapping("/editar/{id}")
    public String editarTime(@PathVariable int id, Model model) {
        return timeService.editarTime(id, model);
    }

    @PostMapping("/atualizar")
    public String atualizarTime(@RequestParam int id,
                               @RequestParam String nome,
                               @RequestParam String cidade,
                               @RequestParam int esporteId) {
        return timeService.atualizarTime(id, nome, cidade, esporteId);
    }

    @GetMapping("/excluir/{id}")
    public String excluirTime(@PathVariable int id) {
        return timeService.excluirTime(id);
    }
}

