package mx.edu.utez.saditarea.controller;

import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "ActualizarUsuarioServlet", value = "/ActualizarUsuarioServlet")
public class ActualizarUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("SE RECIBEN LOS DATOS EN ELL SERVLET DE ACTUALIZAR USUARIO");
        String id = request.getParameter("id");
        String correo = request.getParameter("correo");
        String nombre1_U = request.getParameter("nombre1_U");
        String apellido1_U = request.getParameter("apellido1_U");
        String nombre2_U = request.getParameter("nombre2_U");
        String apellido2_U = request.getParameter("apellido2_U");
        String telefono = request.getParameter("telefono");
        String contrasena = request.getParameter("contrasena");
       // String codigo = request.getParameter("codigo");
        String rol = request.getParameter("rol");

        System.out.println("El id es:" + id);
        System.out.println("El correo es:" + correo);
        System.out.println("El nombre es:" + nombre1_U);
        System.out.println("El apellido es:" + apellido1_U);
        System.out.println("El nombre es:" + nombre2_U);
        System.out.println("El apellido es:" + apellido2_U);

        System.out.println("El telefono es:" + telefono);
        System.out.println("El contrasena es:" + contrasena);
        //System.out.println("El codigo es:" + codigo);
        System.out.println("El rol es:" + rol);

        UserDao dao = new UserDao();
        Usuario usuario = dao.getById(id);
        usuario.setIdUsuario(id);
        usuario.setCorreo(correo);
        usuario.setNombre1_U(nombre1_U);
        usuario.setApellido1_U(apellido1_U);
        usuario.setNombre2_U(nombre2_U);
        usuario.setApellido2_U(apellido2_U);
        usuario.setTelefono(telefono);
        usuario.setContrasena(contrasena);
        //usuario.setCodigo(codigo);
        usuario.setRol(rol);

        boolean isUpdated = dao.update(usuario);
        System.out.println("is update da: "+isUpdated);
        if (isUpdated) {
            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
