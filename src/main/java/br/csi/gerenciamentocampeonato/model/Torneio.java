package br.csi.gerenciamentocampeonato.model;

import java.util.Date;

public class Torneio {
    private int id;
    private String nome;
    private Date dataInicio;
    private Date dataFim;
    private int esporteId;
    private String nomeEsporte;


    public Torneio(String nome, Date dataInicio, Date dataFim, int esporteId) {
        this.nome = nome;
        this.dataInicio = dataInicio;
        this.dataFim = dataFim;
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

    public Date getDataInicio() {
        return dataInicio;
    }

    public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    }

    public Date getDataFim() {
        return dataFim;
    }

    public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
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
