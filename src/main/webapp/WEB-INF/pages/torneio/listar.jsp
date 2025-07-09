<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gerenciar Torneios</title>
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
                <a class="nav-link active" href="/torneio">Torneios</a>
                <a class="nav-link" href="/esporte">Esportes</a>
                <a class="nav-link" href="/time">Times</a>
                <a class="nav-link" href="/partida">Partidas</a>
                <a class="nav-link" href="/login?logout=true">Sair</a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2><i class="bi bi-calendar-event"></i> Gerenciar Torneios</h2>
                    <a href="/torneio/novo" class="btn btn-success">
                        <i class="bi bi-plus-circle"></i> Novo Torneio
                    </a>
                </div>

                <div class="card shadow">
                    <div class="card-body">
                        <c:if test="${not empty torneios}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead class="table-primary">
                                        <tr>
                                            <th>ID</th>
                                            <th>Nome</th>
                                            <th>Data Início</th>
                                            <th>Data Fim</th>
                                            <th>Esporte</th>
                                            <th class="text-center">Ações</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="torneio" items="${torneios}">
                                            <tr>
                                                <td>${torneio.id}</td>
                                                <td><strong>${torneio.nome}</strong></td>
                                                <td>
                                                    <fmt:formatDate value="${torneio.dataInicio}" pattern="dd/MM/yyyy"/>
                                                </td>
                                                <td>
                                                    <fmt:formatDate value="${torneio.dataFim}" pattern="dd/MM/yyyy"/>
                                                </td>
                                                <td>
                                                    <span class="badge bg-info">${torneio.nomeEsporte}</span>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group">
                                                        <a href="/partida/torneio/${torneio.id}" class="btn btn-sm btn-info">
                                                            <i class="bi bi-eye"></i> Visualizar
                                                        </a>
                                                        <a href="/torneio/editar/${torneio.id}" class="btn btn-sm btn-warning">
                                                            <i class="bi bi-pencil"></i> Editar
                                                        </a>
                                                        <a href="/torneio/excluir/${torneio.id}" 
                                                           class="btn btn-sm btn-danger"
                                                           onclick="return confirm('Tem certeza que deseja excluir este torneio?')">
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
                        
                        <c:if test="${empty torneios}">
                            <div class="text-center py-5">
                                <i class="bi bi-calendar-x display-1 text-muted"></i>
                                <h4 class="mt-3 text-muted">Nenhum torneio encontrado</h4>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

