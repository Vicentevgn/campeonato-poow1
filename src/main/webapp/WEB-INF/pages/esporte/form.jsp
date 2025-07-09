<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty esporte ? 'Novo' : 'Editar'} Esporte</title>
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
                <a class="nav-link active" href="/esporte">Esportes</a>
                <a class="nav-link" href="/login?logout=true">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-dribbble"></i>
                            ${empty esporte ? 'Novo Esporte' : 'Editar Esporte'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${empty esporte ? '/esporte/salvar' : '/esporte/atualizar'}" method="post">
                            <c:if test="${not empty esporte}">
                                <input type="hidden" name="id" value="${esporte.id}">
                            </c:if>
                            
                            <div class="mb-3">
                                <label for="nome" class="form-label">
                                    <i class="bi bi-card-text"></i> Nome do Esporte
                                </label>
                                <input type="text" class="form-control" id="nome" name="nome" 
                                       value="${esporte.nome}" required 
                                       placeholder="Ex: Futebol, Basquete, Vôlei...">
                            </div>

                            <div class="mb-3">
                                <label for="jogadoresPorTime" class="form-label">
                                    <i class="bi bi-people"></i> Jogadores por Time
                                </label>
                                <input type="number" class="form-control" id="jogadoresPorTime" name="jogadoresPorTime" 
                                       value="${esporte.jogadoresPorTime}" required min="1" max="50"
                                       placeholder="Número de jogadores por time">
                                <div class="form-text">
                                    Informe quantos jogadores cada time deve ter neste esporte.
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="/esporte" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Voltar
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-check-circle"></i>
                                    ${empty esporte ? 'Criar Esporte' : 'Atualizar Esporte'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Card com exemplos de esportes -->
                <div class="card mt-4 border-info">
                    <div class="card-header bg-info text-white">
                        <h6 class="mb-0"><i class="bi bi-lightbulb"></i> Exemplos de Esportes</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-6">
                                <ul class="list-unstyled mb-0">
                                    <li><i class="bi bi-circle-fill text-success me-2"></i>Futebol: 11 jogadores</li>
                                    <li><i class="bi bi-circle-fill text-warning me-2"></i>Basquete: 5 jogadores</li>
                                    <li><i class="bi bi-circle-fill text-info me-2"></i>Vôlei: 6 jogadores</li>
                                </ul>
                            </div>
                            <div class="col-6">
                                <ul class="list-unstyled mb-0">
                                    <li><i class="bi bi-circle-fill text-danger me-2"></i>Futsal: 5 jogadores</li>
                                    <li><i class="bi bi-circle-fill text-primary me-2"></i>Handebol: 7 jogadores</li>
                                    <li><i class="bi bi-circle-fill text-secondary me-2"></i>Rugby: 15 jogadores</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

