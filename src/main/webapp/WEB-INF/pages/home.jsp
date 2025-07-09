<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home - Gerenciamento de Campeonatos</title>
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
                <a class="nav-link active" href="/home">Home</a>
                <a class="nav-link" href="/torneio">Torneios</a>
                <a class="nav-link" href="/esporte">Esportes</a>
                <a class="nav-link" href="/time">Times</a>
                <a class="nav-link" href="/partida">Partidas</a>
                <a class="nav-link" href="/login?logout=true">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Hero Section -->
        <div class="row mb-5">
            <div class="col-12">
                <div class="card bg-primary text-white">
                    <div class="card-body text-center py-5">
                        <i class="bi bi-trophy display-1 mb-3"></i>
                        <h1 class="display-4">Bem-vindo ao Sistema de Gerenciamento</h1>
                        <p class="lead">Organize e gerencie seus campeonatos esportivos de forma simples e eficiente</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="row mb-4">
            <div class="col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-calendar-event display-4 text-primary mb-3"></i>
                        <h5 class="card-title">Gerenciar Torneios</h5>
                        <p class="card-text">Crie, edite e organize seus torneios esportivos</p>
                        <a href="/torneio" class="btn btn-primary">
                            <i class="bi bi-arrow-right"></i> Acessar Torneios
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-dribbble display-4 text-success mb-3"></i>
                        <h5 class="card-title">Gerenciar Esportes</h5>
                        <p class="card-text">Configure os esportes disponíveis para seus torneios</p>
                        <a href="/esporte" class="btn btn-success">
                            <i class="bi bi-arrow-right"></i> Acessar Esportes
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-shield-check display-4 text-info mb-3"></i>
                        <h5 class="card-title">Gerenciar Times</h5>
                        <p class="card-text">Cadastre e organize os times participantes</p>
                        <a href="/time" class="btn btn-info">
                            <i class="bi bi-arrow-right"></i> Acessar Times
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <i class="bi bi-controller display-4 text-warning mb-3"></i>
                        <h5 class="card-title">Gerenciar Partidas</h5>
                        <p class="card-text">Controle os jogos e acompanhe o progresso dos campeonatos</p>
                        <a href="/partida" class="btn btn-warning">
                            <i class="bi bi-arrow-right"></i> Acessar Partidas
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Torneios Recentes -->
        <div class="row">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-light">
                        <h5 class="mb-0">
                            <i class="bi bi-calendar-event"></i> Torneios Cadastrados
                        </h5>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty torneios}">
                            <div class="row">
                                <c:forEach var="torneio" items="${torneios}">
                                    <div class="col-md-6 col-lg-4 mb-3">
                                        <div class="card border-primary">
                                            <div class="card-body">
                                                <h6 class="card-title text-primary">
                                                    <i class="bi bi-trophy"></i> ${torneio.nome}
                                                </h6>
                                                <p class="card-text">
                                                    <small class="text-muted">
                                                        <i class="bi bi-calendar-check"></i> 
                                                        <fmt:formatDate value="${torneio.dataInicio}" pattern="dd/MM/yyyy"/>
                                                        até
                                                        <fmt:formatDate value="${torneio.dataFim}" pattern="dd/MM/yyyy"/>
                                                    </small>
                                                </p>
                                                <span class="badge bg-info">
                                                    <i class="bi bi-dribbble"></i> ${torneio.nomeEsporte}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty torneios}">
                            <div class="text-center py-4">
                                <i class="bi bi-calendar-x display-4 text-muted"></i>
                                <h5 class="mt-3 text-muted">Nenhum torneio cadastrado</h5>
                                <p class="text-muted">Comece criando seu primeiro torneio!</p>
                                <a href="/torneio/novo" class="btn btn-primary">
                                    <i class="bi bi-plus-circle"></i> Criar Primeiro Torneio
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-3 mt-5">
        <div class="container">
            <p class="mb-0">
                <i class="bi bi-trophy"></i> Sistema de Gerenciamento de Campeonatos - 
                Desenvolvido com Spring Boot e Bootstrap
            </p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

