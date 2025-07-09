package br.csi.gerenciamentocampeonato.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectarDB {

    public static Connection conectarPostgres() throws SQLException, ClassNotFoundException {
        try {
            Class.forName("org.postgresql.Driver");
            String url = "jdbc:postgresql://localhost:5433/campeonato";
            String user = "postgres";
            String password = "postgres";
            Connection connection = DriverManager.getConnection(url, user, password);
            return connection;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erro ao conectar com o banco de dados: " + e.getMessage());
        }
        return null;
    }
}
