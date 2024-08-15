package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UserDao;

import java.io.IOException;

@WebServlet(name = "ActualizarEstadoUsuario", value = "/updateUsuarioE")
public class ActualizarEstadoUsuario extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        int estado = Integer.parseInt(req.getParameter("estado"));
        System.out.println("El estado de este usuario es: " + estado);
        System.out.println("El id del usuario es: " + id);

        UserDao dao = new UserDao();
        String action;

        if (estado == 1) {
            dao.updateOf(id);
            action = "desactivado";
        } else {
            dao.updateOn(id);
            action = "activado";
        }

        resp.sendRedirect("home.jsp?action=" + action);
    }
}
