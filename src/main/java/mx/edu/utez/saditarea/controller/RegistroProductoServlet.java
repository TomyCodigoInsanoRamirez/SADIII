package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.ProductosDao;
import mx.edu.utez.saditarea.modelo.Productos;

import java.io.IOException;

@WebServlet(name = "RegistroProductoServlet", value = "/registroProducto")
public class RegistroProductoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String nombreProducto = req.getParameter("product-name");
        String descripcionProducto = req.getParameter("description");

        // Crear el objeto Productos
        Productos producto = new Productos(0, nombreProducto, descripcionProducto); // ID no se usa en el registro

        // Obtener el DAO
        ProductosDao dao = new ProductosDao();

        // Guardar el producto en la base de datos
        boolean resultado = dao.save(producto);

        String ruta = "index.jsp";
        if (resultado) {
            req.getSession().setAttribute("mensaje", "Producto registrado correctamente");
            ruta = "home.jsp";
        } else {
            req.getSession().setAttribute("mensaje", "Error al registrar el producto");
            ruta = "index.jsp?error=true";
        }

        resp.sendRedirect(ruta);
    }
}
