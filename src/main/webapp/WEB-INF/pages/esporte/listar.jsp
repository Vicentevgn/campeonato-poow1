<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Esportes</title>
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
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="bi bi-dribbble"></i> Gerenciar Esportes</h2>
                    <a href="/esporte/novo" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Novo Esporte
                    </a>
                </div>

                <div class="card shadow">
                    <div class="card-body">
                        <c:if test="${not empty esportes}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>Jogadores por Time</th>
                                            <th class="text-center">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="esporte" items="${esportes}">
                                            <tr>
                                                <td>${esporte.id}</td>
                                                <td>
                                                    <strong><i class="bi bi-dribbble me-2"></i>${esporte.nome}</strong>
                                                </td>
                                                <td>
                                                    <span class="badge bg-info">${esporte.jogadoresPorTime} jogadores</span>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group">
                                                        <a href="/esporte/editar/${esporte.id}" class="btn btn-sm btn-warning">
                                                            <i class="bi bi-pencil"></i> Editar
                                                        </a>
                                                        <a href="/esporte/excluir/${esporte.id}" 
                                                           class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Tem certeza que deseja excluir este esporte?')">
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
                        
                        <c:if test="${empty esportes}">
                            <div class="text-center py-5">
                                <i class="bi bi-dribbble display-1 text-muted"></i>
                                <h4 class="mt-3 text-muted">Nenhum esporte encontrado</h4>
                                <p class="text-muted">Comece criando seu primeiro esporte!</p>
                                <a href="/esporte/novo" class="btn btn-primary">
                                    <i class="bi bi-plus-circle"></i> Criar Primeiro Esporte
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

