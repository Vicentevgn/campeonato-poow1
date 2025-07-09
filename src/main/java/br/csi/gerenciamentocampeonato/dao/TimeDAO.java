package br.csi.gerenciamentocampeonato.dao;

import br.csi.gerenciamentocampeonato.model.Time;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TimeDAO {

    public static void cadastrar(Time time) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO time (nome, cidade, esporte_id) VALUES (?, ?, ?)");
            stmt.setString(1, time.getNome());
            stmt.setString(2, time.getCidade());
            stmt.setInt(3, time.getEsporteId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao cadastrar time: " + e.getMessage());
        }
    }

    public static List<Time> listarTodos() {
        List<Time> times = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM time");
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Time time = new Time(rs.getString("nome"), rs.getString("cidade"), rs.getInt("esporte_id"));
                time.setId(rs.getInt("id"));
                times.add(time);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar times: " + e.getMessage());
        }
        return times;
    }

    public static Time buscarPorId(int id) {
        Time time = null;
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM time WHERE id = ?");
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                time = new Time(rs.getString("nome"), rs.getString("cidade"), rs.getInt("esporte_id"));
                time.setId(rs.getInt("id"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao buscar time por ID: " + e.getMessage());
        }
        return time;
    }

    public static void atualizar(Time time) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("UPDATE time SET nome = ?, cidade = ?, esporte_id = ? WHERE id = ?");
            stmt.setString(1, time.getNome());
            stmt.setString(2, time.getCidade());
            stmt.setInt(3, time.getEsporteId());
            stmt.setInt(4, time.getId());
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao atualizar time: " + e.getMessage());
        }
    }

    public static void excluir(int id) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("DELETE FROM time WHERE id = ?");
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao excluir time: " + e.getMessage());
        }
    }

    public static List<Time> listarPorEsporte(int esporteId) {
        List<Time> times = new ArrayList<>();
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM time WHERE esporte_id = ?");
            stmt.setInt(1, esporteId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Time time = new Time(rs.getString("nome"), rs.getString("cidade"), rs.getInt("esporte_id"));
                time.setId(rs.getInt("id"));
                times.add(time);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao listar times por esporte: " + e.getMessage());
        }
        return times;
    }
}
