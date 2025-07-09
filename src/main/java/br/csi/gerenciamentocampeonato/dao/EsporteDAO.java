package br.csi.gerenciamentocampeonato.dao;

import br.csi.gerenciamentocampeonato.model.Esporte;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EsporteDAO {

    public static List<Esporte> listarTodos() {
        List<Esporte> esportes = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM esporte");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Esporte esporte = new Esporte(rs.getString("nome"), rs.getInt("jogadores_por_time"));
                esporte.setId(rs.getInt("id"));
                esportes.add(esporte);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar esportes: " + e.getMessage());
        }
        return esportes;
    }

    public static void cadastrar(Esporte esporte) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO esporte (nome, jogadores_por_time) VALUES (?, ?)");
            stmt.setString(1, esporte.getNome());
            stmt.setInt(2, esporte.getJogadoresPorTime());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao cadastrar esporte: " + e.getMessage());
        }
    }

    public static Esporte buscarPorId(int id) {
        Esporte esporte = null;
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM esporte WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                esporte = new Esporte(rs.getString("nome"), rs.getInt("jogadores_por_time"));
                esporte.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar esporte por ID: " + e.getMessage());
        }
        return esporte;
    }

    public static void atualizar(Esporte esporte) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("UPDATE esporte SET nome = ?, jogadores_por_time = ? WHERE id = ?");
            stmt.setString(1, esporte.getNome());
            stmt.setInt(2, esporte.getJogadoresPorTime());
            stmt.setInt(3, esporte.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao atualizar esporte: " + e.getMessage());
        }
    }

    public static void excluir(int id) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM esporte WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao excluir esporte: " + e.getMessage());
        }
    }
}
