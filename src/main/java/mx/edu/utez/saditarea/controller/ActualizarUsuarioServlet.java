package mx.edu.utez.saditarea.controller;

import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ActualizarUsuarioServlet")
public class ActualizarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String correo = request.getParameter("correo");
        String nombre1_U = request.getParameter("nombre1_U");
        String apellido1_U = request.getParameter("apellido1_U");
        String nombre2_U = request.getParameter("nombre2_U");
        String apellido2_U = request.getParameter("apellido2_U");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");
        String codigo = request.getParameter("codigo");
        String rol = request.getParameter("rol");

        UserDao dao = new UserDao();
        Usuario usuario = dao.getById(id);
        usuario.setCorreo(correo);
        usuario.setNombre1_U(nombre1_U);
        usuario.setApellido1_U(apellido1_U);
        usuario.setNombre2_U(nombre2_U);
        usuario.setApellido2_U(apellido2_U);
        usuario.setTelefono(telefono);
        usuario.setContrasena(contrasena);
        usuario.setCodigo(codigo);
        usuario.setRol(rol);

        boolean isUpdated = dao.update(usuario);

        if (isUpdated) {
            response.sendRedirect("nombre_de_tu_jsp.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
