package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.ProductosDao;
import mx.edu.utez.saditarea.modelo.Productos;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "MostrarProductosServlet", value = "/mostrarProductos")
public class MostrarProductosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ProductosDao dao = new ProductosDao();
        List<Productos> productosList = dao.getAll();

        req.setAttribute("productos", productosList);
        req.getRequestDispatcher("/productos.jsp").forward(req, resp);
    }
}
