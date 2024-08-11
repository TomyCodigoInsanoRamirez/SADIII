package mx.edu.utez.saditarea.controller;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LogoutServlet", value = "/cerrarSesion")
public class Logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener la sesión actual, si existe
        HttpSession sesion = req.getSession(false);

        // Si la sesión existe, invalidarla
        if (sesion != null) {
            sesion.invalidate();
        }

        // Redirigir al usuario a la página de inicio o a una página de confirmación de cierre de sesión
        resp.sendRedirect(req.getContextPath() + "/index.jsp");
    }
}
