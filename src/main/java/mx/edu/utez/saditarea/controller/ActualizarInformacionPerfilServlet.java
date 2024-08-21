package mx.edu.utez.saditarea.controller;

import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ActualizarInformacionPerfilServlet", value = "/ActualizarUsuario2Servlet")
public class ActualizarInformacionPerfilServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SE RECIBEN LOS DATOS EN EL SERVLET DE ACTUALIZAR USUARIO");

        // Obtener parámetros del formulario
        String id = request.getParameter("id");
        String correo = request.getParameter("correo");
        String nombre1_U = request.getParameter("nombre1_U");
        String apellido1_U = request.getParameter("apellido1_U");
        String nombre2_U = request.getParameter("nombre2_U");
        String apellido2_U = request.getParameter("apellido2_U");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol");

        // Validar parámetros
        if (id == null || id.trim().isEmpty()) {
            response.sendRedirect("error.jsp?msg=ID no válido");
            return;
        }

        System.out.println("El id es: " + id);
        System.out.println("El correo es: " + correo);
        System.out.println("El nombre 1 es: " + nombre1_U);
        System.out.println("El apellido 1 es: " + apellido1_U);
        System.out.println("El nombre 2 es: " + nombre2_U);
        System.out.println("El apellido 2 es: " + apellido2_U);
        System.out.println("El telefono es: " + telefono);
        System.out.println("La contraseña es: " + contrasena);
        System.out.println("El rol es: " + rol);

        // Crear instancia de UserDao
        UserDao dao = new UserDao();
        Usuario usuario = dao.getById(id);

        if (usuario != null) {
            // Actualizar los campos del usuario
            usuario.setCorreo(correo);
            usuario.setNombre1_U(nombre1_U);
            usuario.setApellido1_U(apellido1_U);
            usuario.setNombre2_U(nombre2_U);
            usuario.setApellido2_U(apellido2_U);
            usuario.setTelefono(telefono);
            usuario.setContrasena(contrasena);
            usuario.setRol(rol);

            // Actualizar el usuario en la base de datos
            boolean isUpdated = dao.update(usuario);
            System.out.println("is update da: " + isUpdated);

            if (isUpdated) {
                response.sendRedirect("Profile.jsp");
            } else {
                response.sendRedirect("error.jsp?msg=No se pudo actualizar el usuario");
            }
        } else {
            // Redirige a una página de error si el usuario no se encuentra
            response.sendRedirect("error.jsp?msg=Usuario no encontrado");
        }
    }
}
