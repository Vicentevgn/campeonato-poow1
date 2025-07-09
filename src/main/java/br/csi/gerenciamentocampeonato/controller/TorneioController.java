package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.service.TorneioService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/torneio")
public class TorneioController {

    private final TorneioService torneioService = new TorneioService();

    @GetMapping
    public String listarTorneios(Model model) {
        return torneioService.listarTorneios(model);
    }

    @GetMapping("/novo")
    public String novoTorneio(Model model) {
        return torneioService.novoTorneio(model);
    }

    @PostMapping("/salvar")
    public String salvarTorneio(@RequestParam String nome,
                               @RequestParam String dataInicio,
                               @RequestParam String dataFim,
                               @RequestParam int esporteId) {
        return torneioService.salvarTorneio(nome, dataInicio, dataFim, esporteId);
    }

    @GetMapping("/editar/{id}")
    public String editarTorneio(@PathVariable int id, Model model) {
        return torneioService.editarTorneio(id, model);
    }

    @PostMapping("/atualizar")
    public String atualizarTorneio(@RequestParam int id,
                                  @RequestParam String nome,
                                  @RequestParam String dataInicio,
                                  @RequestParam String dataFim,
                                  @RequestParam int esporteId) {
        return torneioService.atualizarTorneio(id, nome, dataInicio, dataFim, esporteId);
    }

    @GetMapping("/excluir/{id}")
    public String excluirTorneio(@PathVariable int id) {
        return torneioService.excluirTorneio(id);
    }
}

