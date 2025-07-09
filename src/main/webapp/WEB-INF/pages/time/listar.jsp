<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Times</title>
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
                <a class="nav-link active" href="/time">Times</a>
                <a class="nav-link" href="/partida">Partidas</a>
                <a class="nav-link" href="/login?logout=true">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="bi bi-shield-check"></i> Gerenciar Times</h2>
                    <a href="/time/novo" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Novo Time
                    </a>
                </div>

                <div class="card shadow">
                    <div class="card-body">
                        <c:if test="${not empty times}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>Cidade</th>
                                            <th>Esporte</th>
                                            <th class="text-center">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="time" items="${times}">
                                            <tr>
                                                <td>${time.id}</td>
                                                <td>
                                                    <strong><i class="bi bi-shield-check text-primary me-2"></i>${time.nome}</strong>
                                                </td>
                                                <td>
                                                    <i class="bi bi-geo-alt text-muted me-1"></i>${time.cidade}
                                                </td>
                                                <td>
                                                    <span class="badge bg-info">
                                                        <i class="bi bi-dribbble me-1"></i>${time.nomeEsporte}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group">
                                                        <a href="/time/editar/${time.id}" class="btn btn-sm btn-warning">
                                                            <i class="bi bi-pencil"></i> Editar
                                                        </a>
                                                        <a href="/time/excluir/${time.id}" 
                                                           class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Tem certeza que deseja excluir este time?')">
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
                        
                        <c:if test="${empty times}">
                            <div class="text-center py-5">
                                <i class="bi bi-shield-x display-1 text-muted"></i>
                                <h4 class="mt-3 text-muted">Nenhum time encontrado</h4>
                                <p class="text-muted">Comece criando seu primeiro time!</p>
                                <a href="/time/novo" class="btn btn-primary">
                                    <i class="bi bi-plus-circle"></i> Criar Primeiro Time
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>

                <!-- Cards com estatísticas por esporte -->
                <c:if test="${not empty times}">
                    <div class="row mt-4">
                        <div class="col-12">
                            <h5><i class="bi bi-bar-chart"></i> Times por Esporte</h5>
                        </div>
                        <c:forEach var="esporte" items="${esportes}">
                            <div class="col-md-4 mb-3">
                                <div class="card border-info">
                                    <div class="card-body text-center">
                                        <i class="bi bi-dribbble text-info display-6"></i>
                                        <h6 class="mt-2">${esporte.nome}</h6>
                                        <h4 class="text-info">
                                            <c:set var="countTimes" value="0"/>
                                            <c:forEach var="time" items="${times}">
                                                <c:if test="${time.esporteId == esporte.id}">
                                                    <c:set var="countTimes" value="${countTimes + 1}"/>
                                                </c:if>
                                            </c:forEach>
                                            ${countTimes} times
                                        </h4>
                                        <small class="text-muted">${esporte.jogadoresPorTime} jogadores por time</small>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

