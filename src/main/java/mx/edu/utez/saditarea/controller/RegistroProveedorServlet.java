package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.ProveedoresDao;
import mx.edu.utez.saditarea.modelo.Proveedores;

import java.io.IOException;

@WebServlet(name = "RegistroProveedorServlet", value = "/registroProveedor")
public class RegistroProveedorServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        System.out.println("Si llegaron lo datos");
        String rfc = req.getParameter("rfc");
        String razonSocial = req.getParameter("razonSocial");
        String codigoPostal = req.getParameter("cp");
        String direccion = req.getParameter("direccion");
        String nombre1 = req.getParameter("nombre1");
        String nombre2 = req.getParameter("nombre2");
        String apellido1 = req.getParameter("apellido1");
        String apellido2 = req.getParameter("apellido2");
        String telefono = req.getParameter("telefono");
        String nombre1A = req.getParameter("nombre1A");
        String nombre2A = req.getParameter("nombre2A");
        String apellido1A = req.getParameter("apellido1A");
        String apellido2A = req.getParameter("apellido2A");
        String telefonoA = req.getParameter("telefonoA");

        // Crear el objeto Proveedores
        Proveedores proveedor = new Proveedores(rfc, razonSocial, codigoPostal, direccion, nombre1, nombre2, apellido1, apellido2, telefono, nombre1A, nombre2A, apellido1A, apellido2A, telefonoA);

        // Obtener la sesión y el DAO
        HttpSession sesion = req.getSession();
        ProveedoresDao dao = new ProveedoresDao();

        // Guardar el proveedor en la base de datos
        boolean resultado = dao.save(proveedor);

        String ruta = "index.jsp";
        if (resultado) {
            sesion.setAttribute("mensaje", "Proveedor registrado correctamente");
            ruta = "home.jsp";
        } else {
            sesion.setAttribute("mensaje", "Error al registrar el proveedor");
            ruta = "index.jsp?error=true";
        }

        resp.sendRedirect(ruta);
    }
}
