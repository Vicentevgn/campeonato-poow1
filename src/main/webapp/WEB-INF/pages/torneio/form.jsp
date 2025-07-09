<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty torneio ? 'Novo' : 'Editar'} Torneio</title>
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
                            <i class="bi bi-calendar-event"></i>
                            ${empty torneio ? 'Novo Torneio' : 'Editar Torneio'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${empty torneio ? '/torneio/salvar' : '/torneio/atualizar'}" method="post">
                            <c:if test="${not empty torneio}">
                                <input type="hidden" name="id" value="${torneio.id}">
                            </c:if>
                            
                            <div class="mb-3">
                                <label for="nome" class="form-label">
                                    <i class="bi bi-card-text"></i> Nome do Torneio
                                </label>
                                <input type="text" class="form-control" id="nome" name="nome" 
                                       value="${torneio.nome}" required>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="dataInicio" class="form-label">
                                            <i class="bi bi-calendar-check"></i> Data de Início
                                        </label>
                                        <input type="date" class="form-control" id="dataInicio" name="dataInicio" 
                                               value="<fmt:formatDate value='${torneio.dataInicio}' pattern='yyyy-MM-dd'/>" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="dataFim" class="form-label">
                                            <i class="bi bi-calendar-x"></i> Data de Fim
                                        </label>
                                        <input type="date" class="form-control" id="dataFim" name="dataFim" 
                                               value="<fmt:formatDate value='${torneio.dataFim}' pattern='yyyy-MM-dd'/>" required>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label for="esporteId" class="form-label">
                                    <i class="bi bi-dribbble"></i> Esporte
                                </label>
                                <select class="form-select" id="esporteId" name="esporteId" required>
                                    <option value="">Selecione um esporte</option>
                                    <c:forEach var="esporte" items="${esportes}">
                                        <option value="${esporte.id}" 
                                                ${torneio.esporteId == esporte.id ? 'selected' : ''}>
                                            ${esporte.nome} (${esporte.jogadoresPorTime} jogadores por time)
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="/torneio" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Voltar
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-check-circle"></i>
                                    ${empty torneio ? 'Criar Torneio' : 'Atualizar Torneio'}
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
        // Validação para garantir que data fim seja posterior à data início
        document.getElementById('dataInicio').addEventListener('change', function() {
            document.getElementById('dataFim').min = this.value;
        });
        
        document.getElementById('dataFim').addEventListener('change', function() {
            const dataInicio = document.getElementById('dataInicio').value;
            if (dataInicio && this.value < dataInicio) {
                alert('A data de fim deve ser posterior à data de início!');
                this.value = '';
            }
        });
    </script>
</body>
</html>

