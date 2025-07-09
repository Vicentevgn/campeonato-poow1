package br.csi.gerenciamentocampeonato.security;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.HandlerInterceptor;

public class AutorizadorInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String url = request.getRequestURI();

        if (url.equals("/") || url.equals("/login") || url.equals("/registrar")) {
            return true;
        }

        if (request.getSession().getAttribute("usuario") == null) {
            response.sendRedirect("/login");
            return false;
        }

        return true;
    }
}
