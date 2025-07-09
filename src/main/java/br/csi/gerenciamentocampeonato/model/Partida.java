package br.csi.gerenciamentocampeonato.model;

public class Partida {
    private int id;
    private int timeAId;
    private int timeBId;
    private Integer placarTimeA;
    private Integer placarTimeB;
    private int torneioId;
    
    // Campos auxiliares para exibição
    private String nomeTimeA;
    private String nomeTimeB;
    private String nomeTorneio;

    public Partida(int timeAId, int timeBId, Integer placarTimeA, Integer placarTimeB, int torneioId) {
        this.timeAId = timeAId;
        this.timeBId = timeBId;
        this.placarTimeA = placarTimeA;
        this.placarTimeB = placarTimeB;
        this.torneioId = torneioId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTimeAId() {
        return timeAId;
    }

    public void setTimeAId(int timeAId) {
        this.timeAId = timeAId;
    }

    public int getTimeBId() {
        return timeBId;
    }

    public void setTimeBId(int timeBId) {
        this.timeBId = timeBId;
    }

    public Integer getPlacarTimeA() {
        return placarTimeA;
    }

    public void setPlacarTimeA(Integer placarTimeA) {
        this.placarTimeA = placarTimeA;
    }

    public Integer getPlacarTimeB() {
        return placarTimeB;
    }

    public void setPlacarTimeB(Integer placarTimeB) {
        this.placarTimeB = placarTimeB;
    }

    public int getTorneioId() {
        return torneioId;
    }

    public void setTorneioId(int torneioId) {
        this.torneioId = torneioId;
    }

    public String getNomeTimeA() {
        return nomeTimeA;
    }

    public void setNomeTimeA(String nomeTimeA) {
        this.nomeTimeA = nomeTimeA;
    }

    public String getNomeTimeB() {
        return nomeTimeB;
    }

    public void setNomeTimeB(String nomeTimeB) {
        this.nomeTimeB = nomeTimeB;
    }

    public String getNomeTorneio() {
        return nomeTorneio;
    }

    public void setNomeTorneio(String nomeTorneio) {
        this.nomeTorneio = nomeTorneio;
    }

    public boolean isJogada() {
        return placarTimeA != null && placarTimeB != null;
    }

    public String getResultado() {
        if (!isJogada()) {
            return "A jogar";
        }
        if (placarTimeA > placarTimeB) {
            return nomeTimeA + " venceu";
        } else if (placarTimeB > placarTimeA) {
            return nomeTimeB + " venceu";
        } else {
            return "Empate";
        }
    }
}

