<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty partida ? 'Nova' : 'Editar'} Partida</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="/home">
                <i class="bi bi-trophy"></i> Gerenciamento de Campeonatos
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="/home">Home</a>
                <a class="nav-link" href="/torneio">Torneios</a>
                <a class="nav-link" href="/esporte">Esportes</a>
                <a class="nav-link active" href="/partida">Partidas</a>
                <a class="nav-link" href="/login?logout=true">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-controller"></i>
                            ${empty partida ? 'Nova Partida' : 'Editar Partida'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${empty partida ? '/partida/salvar' : '/partida/atualizar'}" method="post">
                            <c:if test="${not empty partida}">
                                <input type="hidden" name="id" value="${partida.id}">
                            </c:if>
                            
                            <div class="mb-3">
                                <label for="torneioId" class="form-label">
                                    <i class="bi bi-calendar-event"></i> Torneio
                                </label>
                                <select class="form-select" id="torneioId" name="torneioId" required>
                                    <option value="">Selecione um torneio</option>
                                    <c:forEach var="torneio" items="${torneios}">
                                        <option value="${torneio.id}" 
                                                ${partida.torneioId == torneio.id ? 'selected' : ''}>
                                            ${torneio.nome}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="timeAId" class="form-label">
                                            <i class="bi bi-shield-check text-primary"></i> Time A
                                        </label>
                                        <select class="form-select" id="timeAId" name="timeAId" required>
                                            <option value="">Selecione o Time A</option>
                                            <c:forEach var="time" items="${times}">
                                                <option value="${time.id}" 
                                                        ${partida.timeAId == time.id ? 'selected' : ''}>
                                                    ${time.nome} (${time.cidade})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="timeBId" class="form-label">
                                            <i class="bi bi-shield-check text-danger"></i> Time B
                                        </label>
                                        <select class="form-select" id="timeBId" name="timeBId" required>
                                            <option value="">Selecione o Time B</option>
                                            <c:forEach var="time" items="${times}">
                                                <option value="${time.id}" 
                                                        ${partida.timeBId == time.id ? 'selected' : ''}>
                                                    ${time.nome} (${time.cidade})
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="card border-info mb-3">
                                <div class="card-header bg-info text-white">
                                    <h6 class="mb-0"><i class="bi bi-scoreboard"></i> Placar (Opcional)</h6>
                                </div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="placarTimeA" class="form-label">
                                                    <i class="bi bi-trophy"></i> Gols/Pontos Time A
                                                </label>
                                                <input type="number" class="form-control" id="placarTimeA" name="placarTimeA" 
                                                       value="${partida.placarTimeA}" min="0" 
                                                       placeholder="Deixe vazio se ainda não jogou">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="mb-3">
                                                <label for="placarTimeB" class="form-label">
                                                    <i class="bi bi-trophy"></i> Gols/Pontos Time B
                                                </label>
                                                <input type="number" class="form-control" id="placarTimeB" name="placarTimeB" 
                                                       value="${partida.placarTimeB}" min="0"
                                                       placeholder="Deixe vazio se ainda não jogou">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="alert alert-info">
                                        <i class="bi bi-info-circle"></i>
                                        <strong>Dica:</strong> Deixe os campos de placar vazios para partidas que ainda não foram jogadas. 
                                        Você pode editar depois para adicionar o resultado.
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="/partida" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Voltar
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-check-circle"></i>
                                    ${empty partida ? 'Criar Partida' : 'Atualizar Partida'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validação para evitar que um time jogue contra si mesmo
        document.getElementById('timeAId').addEventListener('change', function() {
            const timeBSelect = document.getElementById('timeBId');
            const selectedTimeA = this.value;
            
            // Reabilitar todas as opções do Time B
            for (let option of timeBSelect.options) {
                option.disabled = false;
            }
            
            // Desabilitar a opção do Time A no select do Time B
            if (selectedTimeA) {
                for (let option of timeBSelect.options) {
                    if (option.value === selectedTimeA) {
                        option.disabled = true;
                        if (timeBSelect.value === selectedTimeA) {
                            timeBSelect.value = '';
                        }
                    }
                }
            }
        });

        document.getElementById('timeBId').addEventListener('change', function() {
            const timeASelect = document.getElementById('timeAId');
            const selectedTimeB = this.value;
            
            // Reabilitar todas as opções do Time A
            for (let option of timeASelect.options) {
                option.disabled = false;
            }
            
            // Desabilitar a opção do Time B no select do Time A
            if (selectedTimeB) {
                for (let option of timeASelect.options) {
                    if (option.value === selectedTimeB) {
                        option.disabled = true;
                        if (timeASelect.value === selectedTimeB) {
                            timeASelect.value = '';
                        }
                    }
                }
            }
        });

        // Validação dos placares
        document.getElementById('placarTimeA').addEventListener('input', function() {
            const placarB = document.getElementById('placarTimeB');
            if (this.value !== '' && placarB.value === '') {
                placarB.required = true;
            } else if (this.value === '') {
                placarB.required = false;
            }
        });

        document.getElementById('placarTimeB').addEventListener('input', function() {
            const placarA = document.getElementById('placarTimeA');
            if (this.value !== '' && placarA.value === '') {
                placarA.required = true;
            } else if (this.value === '') {
                placarA.required = false;
            }
        });
    </script>
</body>
</html>

