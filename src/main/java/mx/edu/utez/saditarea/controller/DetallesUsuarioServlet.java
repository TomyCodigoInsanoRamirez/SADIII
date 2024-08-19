package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;

@WebServlet("/getUserData")
public class DetallesUsuarioServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String idUsuario = request.getParameter("id");
        UserDao userDao = new UserDao();
        Usuario usuario = userDao.getById(idUsuario);

        request.setAttribute("usuario", usuario);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}