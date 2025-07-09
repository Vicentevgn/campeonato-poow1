package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.dao.PartidaDAO;
import br.csi.gerenciamentocampeonato.service.PartidaService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/partida")
public class PartidaController {

    private final PartidaService partidaService = new PartidaService();

    @GetMapping
    public String listarPartidas(Model model) {
        return partidaService.listarPartidas(model);
    }

    @GetMapping("/novo")
    public String novaPartida(Model model) {
        return partidaService.novaPartida(model);
    }

    @PostMapping("/salvar")
    public String salvarPartida(@RequestParam int timeAId,
                               @RequestParam int timeBId,
                               @RequestParam(required = false) Integer placarTimeA,
                               @RequestParam(required = false) Integer placarTimeB,
                               @RequestParam int torneioId) {
        return partidaService.salvarPartida(timeAId, timeBId, placarTimeA, placarTimeB, torneioId);
    }

    @GetMapping("/editar/{id}")
    public String editarPartida(@PathVariable int id, Model model) {
        return partidaService.editarPartida(id, model);
    }

    @PostMapping("/atualizar")
    public String atualizarPartida(@RequestParam int id,
                                  @RequestParam int timeAId,
                                  @RequestParam int timeBId,
                                  @RequestParam(required = false) Integer placarTimeA,
                                  @RequestParam(required = false) Integer placarTimeB,
                                  @RequestParam int torneioId) {
        return partidaService.atualizarPartida(id, timeAId, timeBId, placarTimeA, placarTimeB, torneioId);
    }

    @GetMapping("/excluir/{id}")
    public String excluirPartida(@PathVariable int id) {
        PartidaDAO.excluir(id);
        return "redirect:/partida";
    }

    @GetMapping("/torneio/{torneioId}")
    public String visualizarTorneio(@PathVariable int torneioId, Model model) {
        return partidaService.visualizarTorneio(torneioId, model);
    }
}

