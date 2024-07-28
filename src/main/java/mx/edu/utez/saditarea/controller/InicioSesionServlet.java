package mx.edu.utez.saditarea.controller;


import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;

//El parametro de value es la ruta para llega a este servlet, debe comenzar con una diagonal y la ruta que desees
/*@WebServlet(name = "InicioSesionServlet",value = "/inicioSesion")
public class InicioSesionServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }


    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //El objeto contiene toda la información que viene del jsp
        String user = req.getParameter("correo");
        String contra = req.getParameter("contra"); //aqui cambie pass por contra
        System.out.println(user);
        System.out.println(contra);
        String ruta = "index.jsp";
        HttpSession sesion = req.getSession();
        UserDao dao = new UserDao();
        Usuario usuario = dao.getOne(user,contra);
        //System.out.println(usuario.getCorreo());
        //---------------------------------------------------------------------------
        /*if (usuario.getCorreo() == null){
            System.out.println("TODO BIEN ");
            sesion.setAttribute("mensaje","El usuario no existe en la Base de datoa");
        }else{
            ruta = "bienvenido.jsp";
            sesion.removeAttribute("mensaje");
            sesion.setAttribute("usuario",usuario);
            System.out.println("No");
        }
        resp.sendRedirect(ruta);*/
    /*    if (usuario.getCorreo() == null) {
            System.out.println("TODO BIEN ");
            //sesion.setAttribute("mensaje", "El usuario no existe en la Base de datos");
            ruta = "index.jsp?error=true";
        } else {
            sesion.setAttribute("tipoSesion", "admin");
            ruta = "home.jsp";
            sesion.removeAttribute("mensaje");
            sesion.setAttribute("usuario", usuario);
            System.out.println("No");
        }
        resp.sendRedirect(ruta);

    }

    @Override
    public void destroy() {
    }
}*/
@WebServlet(name = "InicioSesionServlet", value = "/inicioSesion")
public class InicioSesionServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtenemos los parámetros del formulario
        String user = req.getParameter("correo");
        String contra = req.getParameter("contra"); //aqui cambie pass por contra
        System.out.println(user);
        System.out.println(contra);

        // Definimos la ruta por defecto
        String ruta = "index.jsp";
        HttpSession sesion = req.getSession();
        UserDao dao = new UserDao();
        Usuario usuario = dao.getOne(user, contra);

        System.out.println("-------------------------------");
        System.out.println("con el getCorreo: " );
        System.out.println(usuario.getCorreo());
        System.out.println("----------------------------------");
        // Verificamos si el usuario existe
        if (usuario.getCorreo() == null || usuario.getCorreo().equals("")) {
            System.out.println("TODO BIEN ");
            ruta = "index.jsp?error=true";
        } else {
            sesion.setAttribute("usuario", usuario);
            sesion.removeAttribute("mensaje");

            // Verificamos el tipo de usuario y redirigimos a la página correspondiente
            if ("Administrador".equals(usuario.getRol())) {
                sesion.setAttribute("tipoSesion", "admin");
                ruta = "home.jsp";
            } else if ("almacenista".equals(usuario.getRol())) {
                sesion.setAttribute("tipoSesion", "almacenista");
                ruta = "almacenistaHome.jsp";
            } else {
                ruta = "index.jsp?error=true";
            }
        }
        resp.sendRedirect(ruta);
    }

    @Override
    public void destroy() {
    }
}