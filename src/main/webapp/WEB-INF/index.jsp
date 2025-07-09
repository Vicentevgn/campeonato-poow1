<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - Gerenciamento de Campeonatos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
        }
        .register-card {
            backdrop-filter: blur(10px);
            background: rgba(255, 255, 255, 0.95);
            border: none;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        .form-control:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
        }
        .btn-register {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            transition: all 0.3s ease;
        }
        .btn-register:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }
        .logo-section {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .feature-item {
            transition: transform 0.2s ease;
        }
        .feature-item:hover {
            transform: translateX(5px);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-8">
                <div class="card register-card">
                    <div class="row g-0">
                        <!-- Logo Section -->
                        <div class="col-md-5 logo-section d-flex flex-column justify-content-center p-4">
                            <div class="text-center mb-4">
                                <i class="bi bi-trophy display-1 mb-3"></i>
                                <h4 class="mb-3">Gerenciamento de Campeonatos</h4>
                                <p class="small opacity-75 mb-4">
                                    Organize e gerencie seus torneios esportivos de forma profissional
                                </p>
                            </div>
                            
                            <div class="features">
                                <h6 class="mb-3">
                                    <i class="bi bi-star me-2"></i>Funcionalidades
                                </h6>
                                <div class="feature-item mb-2">
                                    <i class="bi bi-check-circle me-2"></i>
                                    <small>Gerenciar Torneios</small>
                                </div>
                                <div class="feature-item mb-2">
                                    <i class="bi bi-check-circle me-2"></i>
                                    <small>Controlar Partidas</small>
                                </div>
                                <div class="feature-item mb-2">
                                    <i class="bi bi-check-circle me-2"></i>
                                    <small>Acompanhar Progresso</small>
                                </div>
                                <div class="feature-item mb-2">
                                    <i class="bi bi-check-circle me-2"></i>
                                    <small>Cadastrar Times</small>
                                </div>
                                <div class="feature-item">
                                    <i class="bi bi-check-circle me-2"></i>
                                    <small>Interface Responsiva</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Register Form -->
                        <div class="col-md-7 p-4">
                            <div class="text-center mb-4">
                                <h3 class="text-primary">
                                    <i class="bi bi-person-plus me-2"></i>Criar Conta
                                </h3>
                                <p class="text-muted">Cadastre-se para começar a usar o sistema</p>
                            </div>

                            <form action="/registrar" method="post" id="registerForm">
                                <div class="mb-3">
                                    <label for="nome" class="form-label">
                                        <i class="bi bi-person me-1"></i>Nome Completo
                                    </label>
                                    <input type="text" class="form-control" id="nome" name="nome" 
                                           placeholder="Digite seu nome completo" required>
                                </div>

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
                                           placeholder="Digite uma senha segura" required minlength="4">
                                    <div class="form-text">
                                        <small>Mínimo de 4 caracteres</small>
                                    </div>
                                </div>

                                <div class="mb-3">
                                    <label for="confirmarSenha" class="form-label">
                                        <i class="bi bi-lock-fill me-1"></i>Confirmar Senha
                                    </label>
                                    <input type="password" class="form-control" id="confirmarSenha" 
                                           placeholder="Digite a senha novamente" required>
                                    <div class="invalid-feedback" id="senhaError">
                                        As senhas não coincidem
                                    </div>
                                </div>

                                <div class="d-grid mb-3">
                                    <button type="submit" class="btn btn-register btn-primary btn-lg">
                                        <i class="bi bi-person-check me-2"></i>Criar Conta
                                    </button>
                                </div>

                                <div class="text-center">
                                    <p class="text-muted mb-0">
                                        Já tem conta? 
                                        <a href="/login" class="text-primary text-decoration-none">
                                            <i class="bi bi-box-arrow-in-right me-1"></i>Entrar
                                        </a>
                                    </p>
                                </div>
                            </form>

                            <!-- Mensagem de erro/sucesso -->
                            <c:if test="${not empty msg}">
                                <div class="alert alert-info alert-dismissible fade show mt-3" role="alert">
                                    <i class="bi bi-info-circle me-2"></i>
                                    ${msg}
                                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                                </div>
                            </c:if>
                        </div>
                    </div>
                </div>

                <!-- Informações adicionais -->
                <div class="row mt-3">
                    <div class="col-md-4">
                        <div class="card border-info text-center">
                            <div class="card-body">
                                <i class="bi bi-shield-check text-info display-6"></i>
                                <h6 class="mt-2">Seguro</h6>
                                <small class="text-muted">Seus dados estão protegidos</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-success text-center">
                            <div class="card-body">
                                <i class="bi bi-lightning text-success display-6"></i>
                                <h6 class="mt-2">Rápido</h6>
                                <small class="text-muted">Cadastro em segundos</small>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card border-warning text-center">
                            <div class="card-body">
                                <i class="bi bi-gift text-warning display-6"></i>
                                <h6 class="mt-2">Gratuito</h6>
                                <small class="text-muted">Sem custos para usar</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validação de confirmação de senha
        document.getElementById('confirmarSenha').addEventListener('input', function() {
            const senha = document.getElementById('senha').value;
            const confirmarSenha = this.value;
            
            if (senha !== confirmarSenha) {
                this.classList.add('is-invalid');
            } else {
                this.classList.remove('is-invalid');
                this.classList.add('is-valid');
            }
        });

        // Validação do formulário
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const senha = document.getElementById('senha').value;
            const confirmarSenha = document.getElementById('confirmarSenha').value;
            
            if (senha !== confirmarSenha) {
                e.preventDefault();
                document.getElementById('confirmarSenha').classList.add('is-invalid');
                document.getElementById('confirmarSenha').focus();
            }
        });

        // Validação em tempo real da senha
        document.getElementById('senha').addEventListener('input', function() {
            const confirmarSenha = document.getElementById('confirmarSenha');
            if (confirmarSenha.value) {
                if (this.value !== confirmarSenha.value) {
                    confirmarSenha.classList.add('is-invalid');
                    confirmarSenha.classList.remove('is-valid');
                } else {
                    confirmarSenha.classList.remove('is-invalid');
                    confirmarSenha.classList.add('is-valid');
                }
            }
        });
    </script>
</body>
</html>

