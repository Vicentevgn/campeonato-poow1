package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.EsporteDAO;
import br.csi.gerenciamentocampeonato.dao.TimeDAO;
import br.csi.gerenciamentocampeonato.model.Esporte;
import br.csi.gerenciamentocampeonato.model.Time;
import org.springframework.ui.Model;

import java.util.List;

public class TimeService {

    public String listarTimes(Model model) {
        List<Time> times = TimeDAO.listarTodos();
        List<Esporte> esportes = EsporteDAO.listarTodos();

        // Adicionar nomes dos esportes aos times
        for (Time time : times) {
            for (Esporte esporte : esportes) {
                if (time.getEsporteId() == esporte.getId()) {
                    time.setNomeEsporte(esporte.getNome());
                }
            }
        }

        model.addAttribute("times", times);
        model.addAttribute("esportes", esportes);

        return "pages/time/listar";
    }

    public String novaPartida(Model model) {
        List<Esporte> esportes = EsporteDAO.listarTodos();
        model.addAttribute("esportes", esportes);

        return "pages/time/form";
    }

    public String salvarTime(String nome, String cidade, int esporteId) {
        Time time = new Time(nome, cidade, esporteId);
        TimeDAO.cadastrar(time);

        return "redirect:/time";
    }

    public String editarTime(int id, Model model) {
        Time time = TimeDAO.buscarPorId(id);
        List<Esporte> esportes = EsporteDAO.listarTodos();

        model.addAttribute("time", time);
        model.addAttribute("esportes", esportes);

        return "pages/time/form";
    }

    public String atualizarTime(int id, String nome, String cidade, int esporteId) {
        Time time = new Time(nome, cidade, esporteId);
        time.setId(id);
        TimeDAO.atualizar(time);

        return "redirect:/time";
    }

    public String excluirTime(int id) {
        TimeDAO.excluir(id);
        return "redirect:/time";
    }
}
