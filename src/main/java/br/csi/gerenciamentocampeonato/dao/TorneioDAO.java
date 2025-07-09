package br.csi.gerenciamentocampeonato.dao;

import br.csi.gerenciamentocampeonato.model.Torneio;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TorneioDAO {

    public static List<Torneio> listarTodos() {
        List<Torneio> torneios = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM torneio");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Torneio torneio = new Torneio(rs.getString("nome"), rs.getDate("data_inicio"), rs.getDate("data_fim"), rs.getInt("esporte_id"));
                torneio.setId(rs.getInt("id"));
                torneios.add(torneio);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar torneios: " + e.getMessage());
        }
        return torneios;
    }


    public static void cadastrar(Torneio torneio) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO torneio (nome, data_inicio, data_fim, esporte_id) VALUES (?, ?, ?, ?)");
            stmt.setString(1, torneio.getNome());
            stmt.setDate(2, new java.sql.Date(torneio.getDataInicio().getTime()));
            stmt.setDate(3, new java.sql.Date(torneio.getDataFim().getTime()));
            stmt.setInt(4, torneio.getEsporteId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao cadastrar torneio: " + e.getMessage());
        }
    }

    public static Torneio buscarPorId(int id) {
        Torneio torneio = null;
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM torneio WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                torneio = new Torneio(rs.getString("nome"), rs.getDate("data_inicio"), rs.getDate("data_fim"), rs.getInt("esporte_id"));
                torneio.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar torneio por ID: " + e.getMessage());
        }
        return torneio;
    }

    public static void atualizar(Torneio torneio) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("UPDATE torneio SET nome = ?, data_inicio = ?, data_fim = ?, esporte_id = ? WHERE id = ?");
            stmt.setString(1, torneio.getNome());
            stmt.setDate(2, new java.sql.Date(torneio.getDataInicio().getTime()));
            stmt.setDate(3, new java.sql.Date(torneio.getDataFim().getTime()));
            stmt.setInt(4, torneio.getEsporteId());
            stmt.setInt(5, torneio.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao atualizar torneio: " + e.getMessage());
        }
    }

    public static void excluir(int id) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM torneio WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao excluir torneio: " + e.getMessage());
        }
    }

}
