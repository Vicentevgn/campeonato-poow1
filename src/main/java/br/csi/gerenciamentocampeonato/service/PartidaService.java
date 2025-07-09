package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.PartidaDAO;
import br.csi.gerenciamentocampeonato.dao.TimeDAO;
import br.csi.gerenciamentocampeonato.dao.TorneioDAO;
import br.csi.gerenciamentocampeonato.model.Partida;
import br.csi.gerenciamentocampeonato.model.Time;
import br.csi.gerenciamentocampeonato.model.Torneio;
import org.springframework.ui.Model;

import java.util.List;

public class PartidaService {

    public String listarPartidas(Model model) {
        List<Partida> partidas = PartidaDAO.listarTodos();
        List<Time> times = TimeDAO.listarTodos();
        List<Torneio> torneios = TorneioDAO.listarTodos();

        // Adicionar nomes dos times e torneios às partidas
        for (Partida partida : partidas) {
            for (Time time : times) {
                if (partida.getTimeAId() == time.getId()) {
                    partida.setNomeTimeA(time.getNome());
                }
                if (partida.getTimeBId() == time.getId()) {
                    partida.setNomeTimeB(time.getNome());
                }
            }
            for (Torneio torneio : torneios) {
                if (partida.getTorneioId() == torneio.getId()) {
                    partida.setNomeTorneio(torneio.getNome());
                }
            }
        }

        model.addAttribute("partidas", partidas);
        model.addAttribute("times", times);
        model.addAttribute("torneios", torneios);

        return "pages/partida/listar";
    }

    public String novaPartida(Model model) {

        List<Time> times = TimeDAO.listarTodos();
        List<Torneio> torneios = TorneioDAO.listarTodos();

        model.addAttribute("times", times);
        model.addAttribute("torneios", torneios);

        return "pages/partida/form";
    }

    public String salvarPartida(int timeAId, int timeBId, Integer placarTimeA, Integer placarTimeB, int torneioId) {
        Partida partida = new Partida(timeAId, timeBId, placarTimeA, placarTimeB, torneioId);
        PartidaDAO.cadastrar(partida);

        return "redirect:/partida";
    }

    public String editarPartida(int id, Model model) {
        Partida partida = PartidaDAO.buscarPorId(id);
        List<Time> times = TimeDAO.listarTodos();
        List<Torneio> torneios = TorneioDAO.listarTodos();

        model.addAttribute("partida", partida);
        model.addAttribute("times", times);
        model.addAttribute("torneios", torneios);

        return "pages/partida/form";
    }

    public String atualizarPartida(int id, int timeAId, int timeBId, Integer placarTimeA, Integer placarTimeB, int torneioId) {
        Partida partida = new Partida(timeAId, timeBId, placarTimeA, placarTimeB, torneioId);
        partida.setId(id);
        PartidaDAO.atualizar(partida);

        return "redirect:/partida";
    }

    public String visualizarTorneio(int torneioId, Model model) {
        Torneio torneio = TorneioDAO.buscarPorId(torneioId);
        List<Partida> partidas = PartidaDAO.listarPorTorneio(torneioId);
        List<Time> times = TimeDAO.listarTodos();

        // Adicionar nomes dos times às partidas
        for (Partida partida : partidas) {
            for (Time time : times) {
                if (partida.getTimeAId() == time.getId()) {
                    partida.setNomeTimeA(time.getNome());
                }
                if (partida.getTimeBId() == time.getId()) {
                    partida.setNomeTimeB(time.getNome());
                }
            }
        }

        model.addAttribute("torneio", torneio);
        model.addAttribute("partidas", partidas);
        model.addAttribute("times", times);

        return "pages/partida/torneio";
    }
}
