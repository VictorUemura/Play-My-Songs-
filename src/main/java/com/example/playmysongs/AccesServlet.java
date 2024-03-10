package com.example.playmysongs;

import com.example.playmysongs.security.User;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import java.io.IOException;

public class AccesServlet extends HttpServlet {
    public boolean senhaVerifica(String senha, String nome){
        String aux = nome.substring(0, nome.indexOf("@"));
        if(senha.compareTo(aux) == 0)
            return true;
        return false;
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String nome =request.getParameter("login");
        if(nome!=null){
            String senha = request.getParameter("senha");
            if(senha!=null && senhaVerifica(senha, nome)){
                User usuario = new User(nome);
                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(60);
                session.setAttribute("user", usuario);
                response.sendRedirect("./uploadscreen.html");
                return;
            }
        }
        return;
    }

    public void destroy() {
    }
}
