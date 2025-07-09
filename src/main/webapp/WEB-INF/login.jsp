<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Gerenciamento de Campeonatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-card {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.95);
            border: none;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: all 0.3s ease;
        }
        .btn-login:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .logo-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6">
                <div class="card login-card">
                    <div class="row g-0">
                        <!-- Logo Section -->
                        <div class="col-md-5 logo-section d-flex flex-column justify-content-center align-items-center p-4">
                            <i class="bi bi-trophy display-1 mb-3"></i>
                            <h4 class="text-center mb-3">Gerenciamento de Campeonatos</h4>
                            <p class="text-center small opacity-75">
                                Sistema completo para organizar e gerenciar seus torneios esportivos
                            </p>
                        </div>
                        
                        <!-- Login Form -->
                        <div class="col-md-7 p-4">
                            <div class="text-center mb-4">
                                <h3 class="text-primary">
                                    <i class="bi bi-person-circle me-2"></i>Entrar
                                </h3>
                                <p class="text-muted">Acesse sua conta para continuar</p>
                            </div>

                            <form action="/login" method="post">
                                <div class="mb-3">
                                    <label for="email" class="form-label">
                                        <i class="bi bi-envelope me-1"></i>E-mail
                                    </label>
                                    <input type="email" class="form-control" id="email" name="email" 
                                           placeholder="seu@email.com" required>
                                </div>

                                <div class="mb-3">
                                    <label for="senha" class="form-label">
                                        <i class="bi bi-lock me-1"></i>Senha
                                    </label>
                                    <input type="password" class="form-control" id="senha" name="senha" 
                                           placeholder="Digite sua senha" required>
                                </div>

                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-login btn-primary btn-lg">
                                        <i class="bi bi-box-arrow-in-right me-2"></i>Entrar
                                    </button>
                                </div>

                                <div class="text-center">
                                    <p class="text-muted mb-0">
                                        Não tem conta? 
                                        <a href="/" class="text-primary text-decoration-none">
                                            <i class="bi bi-person-plus me-1"></i>Cadastre-se
                                        </a>
                                    </p>
                                </div>
                            </form>

                            <!-- Mensagem de erro/sucesso -->
                            <c:if test="${not empty msg}">
                                <div class="alert alert-warning alert-dismissible fade show mt-3" role="alert">
                                    <i class="bi bi-exclamation-triangle me-2"></i>
                                    ${msg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- Credenciais de demonstração -->
                <div class="card mt-3 border-info">
                    <div class="card-body text-center">
                        <h6 class="card-title text-info">
                            <i class="bi bi-info-circle me-1"></i>Credenciais de Demonstração
                        </h6>
                        <p class="card-text small mb-2">
                            <strong>E-mail:</strong> admin@admin.com<br>
                            <strong>Senha:</strong> admin
                        </p>
                        <small class="text-muted">Use essas credenciais para testar o sistema</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

