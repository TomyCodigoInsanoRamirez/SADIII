package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;

@WebServlet(name = "MostrarUsuarioServlet", value = "/usuario")
public class MostrarUsuarioServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        // Puedes inicializar recursos aquí si es necesario
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String correo = req.getParameter("correo");
        String contrasena = req.getParameter("contrasena");

        UserDao userDao = new UserDao();
        Usuario usuario = userDao.getOne(correo, contrasena);

        // Establece el usuario como atributo de solicitud
        req.setAttribute("usuario", usuario);

        // Redirige a la vista JSP
        String ruta = (usuario != null && usuario.getCorreo() != null) ? "usuario.jsp" : "index.jsp?error=true";
        req.getRequestDispatcher(ruta).forward(req, resp);
    }

    @Override
    public void destroy() {
        // Limpia los recursos si es necesario
    }
}
