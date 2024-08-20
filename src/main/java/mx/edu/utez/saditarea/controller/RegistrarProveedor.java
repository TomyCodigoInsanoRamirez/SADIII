package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.ProveedoresDao;
import mx.edu.utez.saditarea.modelo.Proveedores;

import java.io.IOException;

@WebServlet(name = "RegistrarProveedor", value = "/RegistrarProveedor")
public class RegistrarProveedor extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action"); // Determina la acción a realizar
        ProveedoresDao proveedoresDao = new ProveedoresDao();


            // Registro de proveedor
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
        Proveedores proveedor = new Proveedores(rfc, razonSocial, codigoPostal, direccion, nombre1, nombre2, apellido1, apellido2, telefono, nombre1A, nombre2A, apellido1A, apellido2A, telefonoA, 1);

        // Guardar el proveedor en la base de datos
        boolean resultado = proveedoresDao.save(proveedor);

        String ruta = "index.jsp";
        if (resultado) {
            req.getSession().setAttribute("message", "success");
            ruta = "provedores.jsp?success=true";
        } else {
            //req.getSession().setAttribute("mensaje", "Error al registrar el proveedor");
            req.getSession().setAttribute("message", "error_provedor_existente");
            ruta = "provedores.jsp?error=provedor_existente";
        }

        resp.sendRedirect(ruta);

    }
}