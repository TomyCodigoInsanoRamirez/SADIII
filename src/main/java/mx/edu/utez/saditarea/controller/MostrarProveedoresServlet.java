package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.ProveedoresDao;
import mx.edu.utez.saditarea.modelo.Proveedores;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MostrarProveedoresServlet", value = "/mostrarProveedores")
public class MostrarProveedoresServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProveedoresDao dao = new ProveedoresDao();

        // Obtener la lista de proveedores
        List<Proveedores> proveedores = dao.findAll();

        // Establecer la lista de proveedores en el request
        req.setAttribute("proveedores", proveedores);

        // Redirigir a la JSP para mostrar los proveedores
        req.getRequestDispatcher("provedores.jsp").forward(req, resp);
    }
}
