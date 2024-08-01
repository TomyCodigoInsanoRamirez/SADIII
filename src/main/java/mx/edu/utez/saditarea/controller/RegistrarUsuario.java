package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.AreasDao;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Areas;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegistrarUsuario", value = "/usuarioo")
public class RegistrarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Usuario usuario = new Usuario();
        UserDao dao = new UserDao();
        String idUsuario = req.getParameter("id");
        String nombre1 = req.getParameter("nombre1");
        String nombre2 = req.getParameter("nombre2");
        String apellido1 = req.getParameter("apellido1");
        String apellido2 = req.getParameter("apellido2");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        String rol = req.getParameter("rol");

        usuario.setId(idUsuario);
        usuario.setNombre1_U(nombre1);
        usuario.setNombre2_U(nombre2);
        usuario.setApellido1_U(apellido1);
        usuario.setApellido2_U(apellido2);
        usuario.setCorreo(email);
        usuario.setContrasena(email);
        usuario.setTelefono(telefono);
        usuario.setRol(rol);



        if(dao.insert(usuario)){
            System.out.println("Si se insertó el usuario");
            resp.sendRedirect("home.jsp");
        }else{
            System.out.println("Nel padrino, NO SE INSERTO EL USUARIO");
        }
    }
}
