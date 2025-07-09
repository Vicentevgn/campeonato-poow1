package br.csi.gerenciamentocampeonato.dao;

import br.csi.gerenciamentocampeonato.model.Partida;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PartidaDAO {

    public static void cadastrar(Partida partida) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO partida (time_a_id, time_b_id, placar_time_a, placar_time_b, torneio_id) VALUES (?, ?, ?, ?, ?)");
            stmt.setInt(1, partida.getTimeAId());
            stmt.setInt(2, partida.getTimeBId());
            stmt.setObject(3, partida.getPlacarTimeA());
            stmt.setObject(4, partida.getPlacarTimeB());
            stmt.setInt(5, partida.getTorneioId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao cadastrar partida: " + e.getMessage());
        }
    }

    public static List<Partida> listarTodos() {
        List<Partida> partidas = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM partida");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Partida partida = new Partida(
                        rs.getInt("time_a_id"),
                        rs.getInt("time_b_id"),
                        (Integer) rs.getObject("placar_time_a"),
                        (Integer) rs.getObject("placar_time_b"),
                        rs.getInt("torneio_id")
                );
                partida.setId(rs.getInt("id"));
                partidas.add(partida);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar partidas: " + e.getMessage());
        }
        return partidas;
    }

    public static Partida buscarPorId(int id) {
        Partida partida = null;
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM partida WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                partida = new Partida(
                        rs.getInt("time_a_id"),
                        rs.getInt("time_b_id"),
                        (Integer) rs.getObject("placar_time_a"),
                        (Integer) rs.getObject("placar_time_b"),
                        rs.getInt("torneio_id")
                );
                partida.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar partida por ID: " + e.getMessage());
        }
        return partida;
    }

    public static void atualizar(Partida partida) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("UPDATE partida SET time_a_id = ?, time_b_id = ?, placar_time_a = ?, placar_time_b = ?, torneio_id = ? WHERE id = ?");
            stmt.setInt(1, partida.getTimeAId());
            stmt.setInt(2, partida.getTimeBId());
            stmt.setObject(3, partida.getPlacarTimeA());
            stmt.setObject(4, partida.getPlacarTimeB());
            stmt.setInt(5, partida.getTorneioId());
            stmt.setInt(6, partida.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao atualizar partida: " + e.getMessage());
        }
    }

    public static void excluir(int id) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM partida WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao excluir partida: " + e.getMessage());
        }
    }

    public static List<Partida> listarPorTorneio(int torneioId) {
        List<Partida> partidas = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM partida WHERE torneio_id = ? ORDER BY id");
            stmt.setInt(1, torneioId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Partida partida = new Partida(
                        rs.getInt("time_a_id"),
                        rs.getInt("time_b_id"),
                        (Integer) rs.getObject("placar_time_a"),
                        (Integer) rs.getObject("placar_time_b"),
                        rs.getInt("torneio_id")
                );
                partida.setId(rs.getInt("id"));
                partidas.add(partida);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar partidas por torneio: " + e.getMessage());
        }
        return partidas;
    }
}
