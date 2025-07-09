<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Partidas</title>
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
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="bi bi-controller"></i> Gerenciar Partidas</h2>
                    <a href="/partida/novo" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Nova Partida
                    </a>
                </div>

                <div class="card shadow">
                    <div class="card-body">
                        <c:if test="${not empty partidas}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>ID</th>
                                            <th>Torneio</th>
                                            <th>Time A</th>
                                            <th>Time B</th>
                                            <th>Placar</th>
                                            <th>Status</th>
                                            <th class="text-center">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="partida" items="${partidas}">
                                            <tr>
                                                <td>${partida.id}</td>
                                                <td>
                                                    <span class="badge bg-info">${partida.nomeTorneio}</span>
                                                </td>
                                                <td>
                                                    <strong><i class="bi bi-shield-check text-primary"></i> ${partida.nomeTimeA}</strong>
                                                </td>
                                                <td>
                                                    <strong><i class="bi bi-shield-check text-danger"></i> ${partida.nomeTimeB}</strong>
                                                </td>
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
                                                            <span class="badge bg-success">
                                                                <i class="bi bi-check-circle"></i> Finalizada
                                                            </span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-warning">
                                                                <i class="bi bi-clock"></i> Pendente
                                                            </span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group">
                                                        <a href="/partida/editar/${partida.id}" class="btn btn-sm btn-warning">
                                                            <i class="bi bi-pencil"></i> Editar
                                                        </a>
                                                        <a href="/partida/excluir/${partida.id}" 
                                                           class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Tem certeza que deseja excluir esta partida?')">
                                                            <i class="bi bi-trash"></i> Excluir
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty partidas}">
                            <div class="text-center py-5">
                                <i class="bi bi-controller display-1 text-muted"></i>
                                <h4 class="mt-3 text-muted">Nenhuma partida encontrada</h4>
                                <p class="text-muted">Comece criando sua primeira partida!</p>
                                <a href="/partida/novo" class="btn btn-primary">
                                    <i class="bi bi-plus-circle"></i> Criar Primeira Partida
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Card com estatísticas -->
                <c:if test="${not empty partidas}">
                    <div class="row mt-4">
                        <div class="col-md-4">
                            <div class="card bg-primary text-white">
                                <div class="card-body text-center">
                                    <i class="bi bi-list-ol display-4"></i>
                                    <h5>Total de Partidas</h5>
                                    <h3>${partidas.size()}</h3>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card bg-success text-white">
                                <div class="card-body text-center">
                                    <i class="bi bi-check-circle display-4"></i>
                                    <h5>Finalizadas</h5>
                                    <h3>
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
                        <div class="col-md-4">
                            <div class="card bg-warning text-white">
                                <div class="card-body text-center">
                                    <i class="bi bi-clock display-4"></i>
                                    <h5>Pendentes</h5>
                                    <h3>${partidas.size() - finalizadas}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

