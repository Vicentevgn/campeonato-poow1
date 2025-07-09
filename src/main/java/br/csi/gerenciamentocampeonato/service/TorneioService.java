package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.EsporteDAO;
import br.csi.gerenciamentocampeonato.dao.TorneioDAO;
import br.csi.gerenciamentocampeonato.model.Esporte;
import br.csi.gerenciamentocampeonato.model.Torneio;
import org.springframework.ui.Model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TorneioService {

    public String listarTorneios(Model model) {
        List<Torneio> torneios = TorneioDAO.listarTodos();
        List<Esporte> esportes = EsporteDAO.listarTodos();

        model.addAttribute("torneios", torneios);
        model.addAttribute("esportes", esportes);

        return "pages/torneio/listar";
    }

    public String novoTorneio(Model model) {
        List<Esporte> esportes = EsporteDAO.listarTodos();
        model.addAttribute("esportes", esportes);

        return "pages/torneio/form";
    }

    public String salvarTorneio(String nome, String dataInicio, String dataFim, int esporteId) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date inicio = sdf.parse(dataInicio);
            Date fim = sdf.parse(dataFim);

            Torneio torneio = new Torneio(nome, inicio, fim, esporteId);
            TorneioDAO.cadastrar(torneio);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/torneio";
    }

    public String editarTorneio(int id, Model model) {
        Torneio torneio = TorneioDAO.buscarPorId(id);
        List<Esporte> esportes = EsporteDAO.listarTodos();

        model.addAttribute("torneio", torneio);
        model.addAttribute("esportes", esportes);

        return "pages/torneio/form";
    }

    public String atualizarTorneio(int id, String nome, String dataInicio, String dataFim, int esporteId) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            Date inicio = sdf.parse(dataInicio);
            Date fim = sdf.parse(dataFim);

            Torneio torneio = new Torneio(nome, inicio, fim, esporteId);
            torneio.setId(id);
            TorneioDAO.atualizar(torneio);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/torneio";
    }

    public String excluirTorneio(int id) {
        TorneioDAO.excluir(id);
        return "redirect:/torneio";
    }
}
