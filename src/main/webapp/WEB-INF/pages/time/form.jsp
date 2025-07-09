<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty time ? 'Novo' : 'Editar'} Time</title>
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
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-shield-check"></i>
                            ${empty time ? 'Novo Time' : 'Editar Time'}
                        </h4>
                    </div>
                    <div class="card-body">
                        <form action="${empty time ? '/time/salvar' : '/time/atualizar'}" method="post">
                            <c:if test="${not empty time}">
                                <input type="hidden" name="id" value="${time.id}">
                            </c:if>
                            
                            <div class="mb-3">
                                <label for="nome" class="form-label">
                                    <i class="bi bi-shield-check"></i> Nome do Time
                                </label>
                                <input type="text" class="form-control" id="nome" name="nome" 
                                       value="${time.nome}" required 
                                       placeholder="Ex: Flamengo, São Paulo, Barcelona...">
                            </div>

                            <div class="mb-3">
                                <label for="cidade" class="form-label">
                                    <i class="bi bi-geo-alt"></i> Cidade
                                </label>
                                <input type="text" class="form-control" id="cidade" name="cidade" 
                                       value="${time.cidade}" required 
                                       placeholder="Ex: Rio de Janeiro, São Paulo, Madrid...">
                            </div>

                            <div class="mb-3">
                                <label for="esporteId" class="form-label">
                                    <i class="bi bi-dribbble"></i> Esporte
                                </label>
                                <select class="form-select" id="esporteId" name="esporteId" required>
                                    <option value="">Selecione um esporte</option>
                                    <c:forEach var="esporte" items="${esportes}">
                                        <option value="${esporte.id}" 
                                                ${time.esporteId == esporte.id ? 'selected' : ''}>
                                            ${esporte.nome} (${esporte.jogadoresPorTime} jogadores por time)
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="form-text">
                                    Selecione o esporte que este time pratica.
                                </div>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="/time" class="btn btn-secondary">
                                    <i class="bi bi-arrow-left"></i> Voltar
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-check-circle"></i>
                                    ${empty time ? 'Criar Time' : 'Atualizar Time'}
                                </button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Card com dicas -->
                <div class="card mt-4 border-info">
                    <div class="card-header bg-info text-white">
                        <h6 class="mb-0"><i class="bi bi-lightbulb"></i> Dicas para Cadastro de Times</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6 class="text-info">Nome do Time</h6>
                                <ul class="list-unstyled small">
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Use nomes únicos e reconhecíveis</li>
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Evite caracteres especiais</li>
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Máximo de 50 caracteres</li>
                                </ul>
                            </div>
                            <div class="col-md-6">
                                <h6 class="text-info">Cidade</h6>
                                <ul class="list-unstyled small">
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Cidade de origem do time</li>
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Facilita a organização regional</li>
                                    <li><i class="bi bi-check-circle text-success me-1"></i>Pode incluir estado/país</li>
                                </ul>
                            </div>
                        </div>
                        <div class="alert alert-warning mt-3 mb-0">
                            <i class="bi bi-exclamation-triangle"></i>
                            <strong>Importante:</strong> O esporte selecionado determinará quantos jogadores este time deve ter 
                            e em quais torneios poderá participar.
                        </div>
                    </div>
                </div>

                <!-- Card com exemplos de times por esporte -->
                <div class="card mt-4 border-success">
                    <div class="card-header bg-success text-white">
                        <h6 class="mb-0"><i class="bi bi-star"></i> Exemplos de Times por Esporte</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <h6 class="text-success">⚽ Futebol</h6>
                                <ul class="list-unstyled small">
                                    <li>• Flamengo (Rio de Janeiro)</li>
                                    <li>• Barcelona (Barcelona)</li>
                                    <li>• Manchester United (Manchester)</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h6 class="text-warning">🏀 Basquete</h6>
                                <ul class="list-unstyled small">
                                    <li>• Lakers (Los Angeles)</li>
                                    <li>• Flamengo (Rio de Janeiro)</li>
                                    <li>• Franca (Franca)</li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <h6 class="text-info">🏐 Vôlei</h6>
                                <ul class="list-unstyled small">
                                    <li>• Sada Cruzeiro (Contagem)</li>
                                    <li>• Praia Clube (Uberlândia)</li>
                                    <li>• Minas (Belo Horizonte)</li>
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

