package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.EsporteDAO;
import br.csi.gerenciamentocampeonato.model.Esporte;
import org.springframework.ui.Model;

import java.util.List;

public class EsporteService {

    public String listarEsportes(Model model) {
        List<Esporte> esportes = EsporteDAO.listarTodos();
        model.addAttribute("esportes", esportes);

        return "pages/esporte/listar";
    }

    public String salvarEsporte(String nome, int jogadoresPorTime) {
        Esporte esporte = new Esporte(nome, jogadoresPorTime);
        EsporteDAO.cadastrar(esporte);

        return "redirect:/esporte";
    }

    public String editarEsporte(int id, Model model) {
        Esporte esporte = EsporteDAO.buscarPorId(id);
        model.addAttribute("esporte", esporte);

        return "pages/esporte/form";
    }

    public String atualizarEsporte(int id, String nome, int jogadoresPorTime) {
        Esporte esporte = new Esporte(nome, jogadoresPorTime);
        esporte.setId(id);
        EsporteDAO.atualizar(esporte);

        return "redirect:/esporte";
    }

    public String excluirEsporte(int id) {
        EsporteDAO.excluir(id);
        return "redirect:/esporte";
    }
}
