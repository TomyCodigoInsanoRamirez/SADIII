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
@WebServlet(name = "InicioSesionServlet",value = "/inicioSesion")
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
        if (usuario.getCorreo() == null) {
            System.out.println("TODO BIEN ");
            sesion.setAttribute("mensaje", "El usuario no existe en la Base de datos");
            ruta = "index.jsp?error=true";
        } else {
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
}