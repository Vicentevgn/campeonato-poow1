package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.EsporteDAO;
import br.csi.gerenciamentocampeonato.dao.TorneioDAO;
import br.csi.gerenciamentocampeonato.model.Esporte;
import br.csi.gerenciamentocampeonato.model.Torneio;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;

import java.util.List;

public class HomeService {

    public String setarAtributos(HttpSession session, Model model) {
        model.addAttribute("usuario", session.getAttribute("usuario"));
        List<Torneio> torneios = TorneioDAO.listarTodos();
        List<Esporte> esportes = EsporteDAO.listarTodos();

        for (Torneio torneio : torneios) {
            for (Esporte esporte : esportes) {
                if (torneio.getEsporteId() == esporte.getId()) {
                    torneio.setNomeEsporte(esporte.getNome());
                }
            }
        }

        model.addAttribute("torneios", torneios);
        model.addAttribute("esportes", esportes);

        return "pages/home";
    }
}
