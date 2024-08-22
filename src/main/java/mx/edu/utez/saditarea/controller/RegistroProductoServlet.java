package mx.edu.utez.saditarea.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.ProductosDao;
import mx.edu.utez.saditarea.modelo.Productos;
import mx.edu.utez.saditarea.modelo.RegistroProductoEntrada;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "RegistroProductoServlet", value = "/registroProducto")
public class RegistroProductoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String folio = request.getParameter("folio");
        ProductosDao dao = new ProductosDao();
        RegistroProductoEntrada regE = (RegistroProductoEntrada) dao.producByFolio(folio);

        request.setAttribute("regE", regE);
        RequestDispatcher dispatcher = request.getRequestDispatcher("vistaEntrada.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        // String claveProducto = UUID.randomUUID().toString().substring(0, 7); // Generar una clave única
        String clave = req.getParameter("clave");
        String nombreProducto = req.getParameter("nombre");
        String descripcionProducto = req.getParameter("descipcion");
        String unidadMedida = req.getParameter("unidadMedida");
        System.out.println("Unidad medida: "+unidadMedida+" ---------------------------------------------------------------------------");
        // Crear el objeto Productos
        //Productos producto1 = new Productos(claveProducto, nombreProducto, descripcionProducto, 0); // estadoProducto 0 por defecto
        //Productos producto2 = new Productos(claveProducto, nombreProducto, descripcionProducto, 1); // estadoProducto 1
        Productos producto = new Productos(clave,nombreProducto,descripcionProducto,1,unidadMedida);
        ProductosDao dao = new ProductosDao();
        // Obtener el DAO
        //ProductosDao dao = new ProductosDao();

        // Guardar el producto en la base de datos
        //boolean resultado1 = dao.save(producto1);
        //boolean resultado2 = dao.save(producto2);

        String ruta = "productos.jsp";
        if (dao.save(producto)/*resultado1 && resultado2*/) {
            req.getSession().setAttribute("message", "success");
            ruta = "productos.jsp?success=true";
        } else {
            //req.getSession().setAttribute("mensaje", "Error al registrar el producto");
            req.getSession().setAttribute("message", "error_producto_existente");
            ruta = "productos.jsp?error=producto_existente";
        }
        resp.sendRedirect(ruta);
    }
}// Para éxito