package br.csi.gerenciamentocampeonato.dao;

import br.csi.gerenciamentocampeonato.model.Usuario;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {

    public static Usuario encontrarPorEmail(String email) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM usuario WHERE email = ?");
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Usuario usuario = new Usuario(rs.getString("nome"), rs.getString("email"), rs.getString("senha"));
                usuario.setId(rs.getInt("id"));
                return usuario;
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao encontrar usuário: " + e.getMessage());
        }
        return null;
    }

    public static Usuario inserir(Usuario usuario) {
        try {
            Connection connection = ConectarDB.conectarPostgres();
            PreparedStatement stmt = connection.prepareStatement("INSERT INTO usuario (nome, email, senha) VALUES (?, ?, ?)");
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getEmail());
            stmt.setString(3, usuario.getSenha());
            stmt.executeUpdate();

            return usuario;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao inserir usuário: " + e.getMessage());
            return null;
        }
    }

}
