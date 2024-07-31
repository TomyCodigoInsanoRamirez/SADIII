package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.ProductosDao;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;

@WebServlet(name = "ActualizarUnidadMedida",value = "/ActualizarUnidadMedida")
public class ActualizarUnidadMedida extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("SI LLEGA LA DATA DE LA UNIDAD MEDIDA");

        String abrum = req.getParameter("abrum");
        String nombreUnidadMedida = req.getParameter("nombreUnidadMedida");

        UnidadMedida unidadMedida = new UnidadMedida();
        UnidadMedidaDao dao = new UnidadMedidaDao();

        unidadMedida.setAbreviacionUndidadMedida(abrum);
        unidadMedida.setNombreUnidadMedida(nombreUnidadMedida);

        if(dao.updatee(unidadMedida)){
            //resp.getWriter().println("unidadMedida.jsp");
            resp.sendRedirect("unidadMedida.jsp");
        }
        else{
            System.out.println("No se pudo actualizar la unidad medida");
        }
    }
}