package br.csi.gerenciamentocampeonato.controller;

import br.csi.gerenciamentocampeonato.service.EsporteService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/esporte")
public class EsporteController {

    private final EsporteService esporteService = new EsporteService();

    @GetMapping
    public String listarEsportes(Model model) {
        return esporteService.listarEsportes(model);
    }

    @GetMapping("/novo")
    public String novoEsporte(Model model) {
        return "pages/esporte/form";
    }

    @PostMapping("/salvar")
    public String salvarEsporte(@RequestParam String nome,
                               @RequestParam int jogadoresPorTime) {
        return esporteService.salvarEsporte(nome, jogadoresPorTime);
    }

    @GetMapping("/editar/{id}")
    public String editarEsporte(@PathVariable int id, Model model) {
        return esporteService.editarEsporte(id, model);
    }

    @PostMapping("/atualizar")
    public String atualizarEsporte(@RequestParam int id,
                                  @RequestParam String nome,
                                  @RequestParam int jogadoresPorTime){
        return esporteService.atualizarEsporte(id, nome, jogadoresPorTime);
    }

    @GetMapping("/excluir/{id}")
    public String excluirEsporte(@PathVariable int id) {
        return esporteService.excluirEsporte(id);
    }
}

