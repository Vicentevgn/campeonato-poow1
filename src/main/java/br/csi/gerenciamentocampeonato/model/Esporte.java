package br.csi.gerenciamentocampeonato.model;

public class Esporte {
    private int id;
    private String nome;
    private int jogadoresPorTime;

    public Esporte(String nome, int jogadoresPorTime) {
        this.nome = nome;
        this.jogadoresPorTime = jogadoresPorTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getJogadoresPorTime() {
        return jogadoresPorTime;
    }

    public void setJogadoresPorTime(int jogadoresPorTime) {
        this.jogadoresPorTime = jogadoresPorTime;
    }
}
