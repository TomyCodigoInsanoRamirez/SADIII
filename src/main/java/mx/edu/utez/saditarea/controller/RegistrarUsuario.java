package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;

@WebServlet(name = "RegistrarUsuario", value = "/usuarioo")
public class RegistrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserDao userDao = new UserDao();

        // Registro de usuario
        String nombre1 = request.getParameter("nombre1");
        String nombre2 = request.getParameter("nombre2");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        String rol = request.getParameter("rol");

        // Manejo del caso en que nombre2 puede ser null
        if (nombre2 == null) {
            nombre2 = " ";
        }

        // Usa el constructor para nuevos registros
        Usuario usuario = new Usuario();
        usuario.setNombre1_U(nombre1);
        usuario.setNombre2_U(nombre2);
        usuario.setApellido1_U(apellido1);
        usuario.setApellido2_U(apellido2);
        usuario.setCorreo(email);
        usuario.setContrasena(email); // Considera usar una contraseña encriptada
        usuario.setTelefono(telefono);
        usuario.setRol(rol);

        boolean isSaved = userDao.insert(usuario);

        String ruta = "home.jsp";
        if (isSaved) {
            request.getSession().setAttribute("message", "success");
            ruta = "home.jsp?success=true";
        } else {
            request.getSession().setAttribute("message", "error_usuario_existente");
            ruta = "home.jsp?error=usuario_existente";
        }

        response.sendRedirect(ruta);
    }
}
