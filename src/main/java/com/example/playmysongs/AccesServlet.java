package com.example.playmysongs;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.playmysongs.security.User;

import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class AccesServlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        if (login != null && login.contains("@")) {
            String usernamePart = login.substring(0, login.indexOf('@'));

            if (senha.equals(usernamePart)) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", new User(login, senha));

                String contextPath = request.getContextPath();
                response.sendRedirect(contextPath + "/index.jsp");
            } else {
                erroLogin(request, response, "Senha inválida.");
            }
        } else {
            erroLogin(request, response, "Formato de e-mail inválido.");
        }
    }

    private void erroLogin(HttpServletRequest request, HttpServletResponse response, String mensagemErro) throws ServletException, IOException {
        HttpSession session = request.getSession();
        session.setAttribute("errorMessage", mensagemErro);
        response.sendRedirect(request.getContextPath() + "/index.jsp");
    }


    public void destroy() {}
}
