<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Torneio: ${torneio.nome}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .fase-card {
            border-left: 4px solid;
            transition: all 0.3s ease;
        }
        .fase-grupos { border-left-color: #0d6efd; }
        .fase-oitavas { border-left-color: #198754; }
        .fase-quartas { border-left-color: #fd7e14; }
        .fase-semi { border-left-color: #dc3545; }
        .fase-final { border-left-color: #6f42c1; }
        
        .partida-card {
            transition: transform 0.2s ease;
        }
        .partida-card:hover {
            transform: translateY(-2px);
        }
        
        .placar-destaque {
            font-size: 1.2em;
            font-weight: bold;
        }
        
        .timeline {
            position: relative;
        }
        .timeline::before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            bottom: 0;
            width: 2px;
            background: #dee2e6;
            transform: translateX(-50%);
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 2rem;
        }
        
        .timeline-marker {
            position: absolute;
            left: 50%;
            width: 20px;
            height: 20px;
            background: #0d6efd;
            border-radius: 50%;
            transform: translateX(-50%);
            border: 3px solid white;
            box-shadow: 0 0 0 3px #dee2e6;
        }
    </style>
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
        <!-- Cabeçalho do Torneio -->
        <div class="row mb-4">
            <div class="col-12">
                <div class="card bg-primary text-white shadow">
                    <div class="card-body text-center py-4">
                        <i class="bi bi-trophy display-3 mb-3"></i>
                        <h1 class="display-5">${torneio.nome}</h1>
                        <p class="lead mb-0">
                            <i class="bi bi-calendar-check"></i> 
                            <fmt:formatDate value="${torneio.dataInicio}" pattern="dd/MM/yyyy"/> até 
                            <fmt:formatDate value="${torneio.dataFim}" pattern="dd/MM/yyyy"/>
                        </p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Estatísticas do Torneio -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card text-center border-primary">
                    <div class="card-body">
                        <i class="bi bi-list-ol text-primary display-6"></i>
                        <h5 class="mt-2">Total de Partidas</h5>
                        <h3 class="text-primary">${partidas.size()}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-success">
                    <div class="card-body">
                        <i class="bi bi-check-circle text-success display-6"></i>
                        <h5 class="mt-2">Finalizadas</h5>
                        <h3 class="text-success">
                            <c:set var="finalizadas" value="0"/>
                            <c:forEach var="partida" items="${partidas}">
                                <c:if test="${partida.jogada}">
                                    <c:set var="finalizadas" value="${finalizadas + 1}"/>
                                </c:if>
                            </c:forEach>
                            ${finalizadas}
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-warning">
                    <div class="card-body">
                        <i class="bi bi-clock text-warning display-6"></i>
                        <h5 class="mt-2">Pendentes</h5>
                        <h3 class="text-warning">${partidas.size() - finalizadas}</h3>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card text-center border-info">
                    <div class="card-body">
                        <i class="bi bi-percent text-info display-6"></i>
                        <h5 class="mt-2">Progresso</h5>
                        <h3 class="text-info">
                            <c:choose>
                                <c:when test="${partidas.size() > 0}">
                                    ${Math.round((finalizadas * 100.0) / partidas.size())}%
                                </c:when>
                                <c:otherwise>0%</c:otherwise>
                            </c:choose>
                        </h3>
                    </div>
                </div>
            </div>
        </div>

        <!-- Simulação de Fases do Campeonato -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-dark text-white">
                        <h5 class="mb-0">
                            <i class="bi bi-diagram-3"></i> Avanço do Campeonato por Fases
                        </h5>
                    </div>
                    <div class="card-body">
                        <div class="timeline">
                            <!-- Fase de Grupos -->
                            <div class="timeline-item">
                                <div class="timeline-marker" style="background: #0d6efd;"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card fase-card fase-grupos">
                                            <div class="card-header bg-primary text-white">
                                                <h6 class="mb-0">
                                                    <i class="bi bi-people"></i> Fase de Grupos
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <c:set var="gruposCount" value="0"/>
                                                <c:forEach var="partida" items="${partidas}" begin="0" end="7">
                                                    <c:set var="gruposCount" value="${gruposCount + 1}"/>
                                                </c:forEach>
                                                <p class="mb-1"><strong>Partidas:</strong> ${gruposCount > 8 ? 8 : gruposCount} de 8</p>
                                                <div class="progress">
                                                    <div class="progress-bar bg-primary" style="width: ${(gruposCount > 8 ? 8 : gruposCount) * 12.5}%"></div>
                                                </div>
                                                <small class="text-muted">Classificação dos melhores times</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <c:forEach var="partida" items="${partidas}" begin="0" end="3">
                                                <div class="col-md-6 mb-2">
                                                    <div class="card partida-card border-primary">
                                                        <div class="card-body p-2 text-center">
                                                            <small class="text-muted">Grupo ${partida.id % 4 + 1}</small>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="small">${partida.nomeTimeA}</span>
                                                                <c:choose>
                                                                    <c:when test="${partida.jogada}">
                                                                        <span class="badge bg-success placar-destaque">
                                                                            ${partida.placarTimeA} x ${partida.placarTimeB}
                                                                        </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-warning">vs</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span class="small">${partida.nomeTimeB}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Oitavas de Final -->
                            <div class="timeline-item">
                                <div class="timeline-marker" style="background: #198754;"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card fase-card fase-oitavas">
                                            <div class="card-header bg-success text-white">
                                                <h6 class="mb-0">
                                                    <i class="bi bi-trophy"></i> Oitavas de Final
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <c:set var="oitavasCount" value="0"/>
                                                <c:forEach var="partida" items="${partidas}" begin="8" end="15">
                                                    <c:set var="oitavasCount" value="${oitavasCount + 1}"/>
                                                </c:forEach>
                                                <p class="mb-1"><strong>Partidas:</strong> ${oitavasCount > 8 ? 8 : oitavasCount} de 8</p>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" style="width: ${(oitavasCount > 8 ? 8 : oitavasCount) * 12.5}%"></div>
                                                </div>
                                                <small class="text-muted">Mata-mata eliminatório</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <c:forEach var="partida" items="${partidas}" begin="4" end="7">
                                                <div class="col-md-6 mb-2">
                                                    <div class="card partida-card border-success">
                                                        <div class="card-body p-2 text-center">
                                                            <small class="text-muted">Oitavas ${partida.id % 4 + 1}</small>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="small">${partida.nomeTimeA}</span>
                                                                <c:choose>
                                                                    <c:when test="${partida.jogada}">
                                                                        <span class="badge bg-success placar-destaque">
                                                                            ${partida.placarTimeA} x ${partida.placarTimeB}
                                                                        </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-warning">vs</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span class="small">${partida.nomeTimeB}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Quartas de Final -->
                            <div class="timeline-item">
                                <div class="timeline-marker" style="background: #fd7e14;"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card fase-card fase-quartas">
                                            <div class="card-header bg-warning text-dark">
                                                <h6 class="mb-0">
                                                    <i class="bi bi-award"></i> Quartas de Final
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <c:set var="quartasCount" value="0"/>
                                                <c:forEach var="partida" items="${partidas}" begin="16" end="19">
                                                    <c:set var="quartasCount" value="${quartasCount + 1}"/>
                                                </c:forEach>
                                                <p class="mb-1"><strong>Partidas:</strong> ${quartasCount > 4 ? 4 : quartasCount} de 4</p>
                                                <div class="progress">
                                                    <div class="progress-bar bg-warning" style="width: ${(quartasCount > 4 ? 4 : quartasCount) * 25}%"></div>
                                                </div>
                                                <small class="text-muted">8 melhores times</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <c:forEach var="partida" items="${partidas}" begin="8" end="11">
                                                <div class="col-md-6 mb-2">
                                                    <div class="card partida-card border-warning">
                                                        <div class="card-body p-2 text-center">
                                                            <small class="text-muted">Quartas ${partida.id % 4 + 1}</small>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="small">${partida.nomeTimeA}</span>
                                                                <c:choose>
                                                                    <c:when test="${partida.jogada}">
                                                                        <span class="badge bg-warning text-dark placar-destaque">
                                                                            ${partida.placarTimeA} x ${partida.placarTimeB}
                                                                        </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-secondary">vs</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span class="small">${partida.nomeTimeB}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Semifinal -->
                            <div class="timeline-item">
                                <div class="timeline-marker" style="background: #dc3545;"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card fase-card fase-semi">
                                            <div class="card-header bg-danger text-white">
                                                <h6 class="mb-0">
                                                    <i class="bi bi-star"></i> Semifinal
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <c:set var="semiCount" value="0"/>
                                                <c:forEach var="partida" items="${partidas}" begin="20" end="21">
                                                    <c:set var="semiCount" value="${semiCount + 1}"/>
                                                </c:forEach>
                                                <p class="mb-1"><strong>Partidas:</strong> ${semiCount > 2 ? 2 : semiCount} de 2</p>
                                                <div class="progress">
                                                    <div class="progress-bar bg-danger" style="width: ${(semiCount > 2 ? 2 : semiCount) * 50}%"></div>
                                                </div>
                                                <small class="text-muted">4 melhores times</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="row">
                                            <c:forEach var="partida" items="${partidas}" begin="12" end="13">
                                                <div class="col-md-6 mb-2">
                                                    <div class="card partida-card border-danger">
                                                        <div class="card-body p-2 text-center">
                                                            <small class="text-muted">Semi ${partida.id % 2 + 1}</small>
                                                            <div class="d-flex justify-content-between align-items-center">
                                                                <span class="small">${partida.nomeTimeA}</span>
                                                                <c:choose>
                                                                    <c:when test="${partida.jogada}">
                                                                        <span class="badge bg-danger placar-destaque">
                                                                            ${partida.placarTimeA} x ${partida.placarTimeB}
                                                                        </span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <span class="badge bg-secondary">vs</span>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                <span class="small">${partida.nomeTimeB}</span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Final -->
                            <div class="timeline-item">
                                <div class="timeline-marker" style="background: #6f42c1;"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="card fase-card fase-final">
                                            <div class="card-header" style="background: #6f42c1; color: white;">
                                                <h6 class="mb-0">
                                                    <i class="bi bi-crown"></i> Final
                                                </h6>
                                            </div>
                                            <div class="card-body">
                                                <c:set var="finalCount" value="0"/>
                                                <c:forEach var="partida" items="${partidas}" begin="22" end="22">
                                                    <c:set var="finalCount" value="${finalCount + 1}"/>
                                                </c:forEach>
                                                <p class="mb-1"><strong>Partidas:</strong> ${finalCount > 1 ? 1 : finalCount} de 1</p>
                                                <div class="progress">
                                                    <div class="progress-bar" style="background: #6f42c1; width: ${(finalCount > 1 ? 1 : finalCount) * 100}%"></div>
                                                </div>
                                                <small class="text-muted">Decisão do campeão</small>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <c:if test="${partidas.size() > 14}">
                                            <c:set var="partidaFinal" value="${partidas[14]}"/>
                                            <div class="card partida-card border-dark shadow-lg">
                                                <div class="card-header text-center" style="background: #6f42c1; color: white;">
                                                    <h6 class="mb-0"><i class="bi bi-trophy"></i> GRANDE FINAL</h6>
                                                </div>
                                                <div class="card-body text-center">
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div class="text-center">
                                                            <strong>${partidaFinal.nomeTimeA}</strong>
                                                        </div>
                                                        <div class="text-center">
                                                            <c:choose>
                                                                <c:when test="${partidaFinal.jogada}">
                                                                    <span class="badge fs-5" style="background: #6f42c1;">
                                                                        ${partidaFinal.placarTimeA} x ${partidaFinal.placarTimeB}
                                                                    </span>
                                                                    <br><small class="text-success">
                                                                        <i class="bi bi-trophy"></i> ${partidaFinal.resultado}
                                                                    </small>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <span class="badge bg-warning fs-5">VS</span>
                                                                    <br><small class="text-muted">Aguardando...</small>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </div>
                                                        <div class="text-center">
                                                            <strong>${partidaFinal.nomeTimeB}</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Todas as Partidas -->
        <div class="row mt-4">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-secondary text-white">
                        <h5 class="mb-0">
                            <i class="bi bi-list"></i> Todas as Partidas do Torneio
                        </h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty partidas}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Time A</th>
                                            <th>Time B</th>
                                            <th>Placar</th>
                                            <th>Resultado</th>
                                            <th>Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="partida" items="${partidas}">
                                            <tr>
                                                <td>${partida.id}</td>
                                                <td><strong><i class="bi bi-shield-check text-primary"></i> ${partida.nomeTimeA}</strong></td>
                                                <td><strong><i class="bi bi-shield-check text-danger"></i> ${partida.nomeTimeB}</strong></td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${partida.jogada}">
                                                            <span class="badge bg-success fs-6">
                                                                ${partida.placarTimeA} x ${partida.placarTimeB}
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-warning">A jogar</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${partida.jogada}">
                                                            <span class="text-success">${partida.resultado}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted">Pendente</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td>
                                                    <a href="/partida/editar/${partida.id}" class="btn btn-sm btn-warning">
                                                        <i class="bi bi-pencil"></i> Editar
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty partidas}">
                            <div class="text-center py-4">
                                <i class="bi bi-controller display-4 text-muted"></i>
                                <h5 class="mt-3 text-muted">Nenhuma partida cadastrada para este torneio</h5>
                                <a href="/partida/novo" class="btn btn-primary">
                                    <i class="bi bi-plus-circle"></i> Criar Primeira Partida
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="/partida" class="btn btn-secondary">
                <i class="bi bi-arrow-left"></i> Voltar para Partidas
            </a>
            <a href="/partida/novo" class="btn btn-success">
                <i class="bi bi-plus-circle"></i> Nova Partida
            </a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

