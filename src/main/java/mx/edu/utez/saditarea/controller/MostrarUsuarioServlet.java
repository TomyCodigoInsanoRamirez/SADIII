package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MostrarUsuarioServlet", value = "/usuario")
public class MostrarUsuarioServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UserDao userDao = new UserDao();
        List<Usuario> usuarios = userDao.getAll();

        req.setAttribute("usuarios", usuarios);

        req.getRequestDispatcher("usuarios.jsp").forward(req, resp);
    }
}
