package br.csi.gerenciamentocampeonato.model;

public class Time {
    private int id;
    private String nome;
    private String cidade;
    private int esporteId;
    
    // Campo auxiliar para exibição
    private String nomeEsporte;

    public Time(String nome, String cidade, int esporteId) {
        this.nome = nome;
        this.cidade = cidade;
        this.esporteId = esporteId;
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

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public int getEsporteId() {
        return esporteId;
    }

    public void setEsporteId(int esporteId) {
        this.esporteId = esporteId;
    }

    public String getNomeEsporte() {
        return nomeEsporte;
    }

    public void setNomeEsporte(String nomeEsporte) {
        this.nomeEsporte = nomeEsporte;
    }
}

