package br.csi.gerenciamentocampeonato.service;

import br.csi.gerenciamentocampeonato.dao.UsuarioDAO;
import br.csi.gerenciamentocampeonato.model.Usuario;
import jakarta.servlet.http.HttpSession;

import java.util.Objects;

public class LoginService {

    public String registrar(String nome, String email, String senha, HttpSession session) {
        if (UsuarioDAO.encontrarPorEmail(email) != null) {
            session.setAttribute("msg", "E-mail já cadastrado");
            return "redirect:/login";
        } else if (Objects.isNull(nome) || Objects.isNull(email) || Objects.isNull(senha)) {
            session.setAttribute("msg", "Preencha todos os campos");
            return "redirect:/login";
        }

        Usuario usuario = new Usuario(nome, email, senha);
        UsuarioDAO.inserir(usuario);
        return "redirect:/login";
    }

    public String autenticar(String email, String senha, HttpSession session) {
        Usuario usuario = UsuarioDAO.encontrarPorEmail(email);

        if (usuario != null && usuario.getSenha().equals(senha)) {
            session.setAttribute("usuario", usuario);
            return "redirect:/home";
        }
        session.setAttribute("msg", "E-mail ou senha inválidos");
        return "login";
    }
}
