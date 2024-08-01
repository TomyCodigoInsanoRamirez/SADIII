package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;

import java.io.IOException;

@WebServlet(name = "RegistrarUnidadMedida", value = "/RegistrarUnidadMedida")
public class RegistrarUnidadMedida extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String action = request.getParameter("action"); // Determina la acción a realizar
        UnidadMedidaDao unidadMedidaDao = new UnidadMedidaDao();


            // Registro de unidad de medida
            String abreviacionUnidadMedida = request.getParameter("abrev");
            String nombreUnidadMedida = request.getParameter("nombre");

            // Usa el constructor para nuevos registros
            UnidadMedida unidadMedida = new UnidadMedida(abreviacionUnidadMedida, nombreUnidadMedida, 1);
            boolean isSaved = unidadMedidaDao.save(unidadMedida);

            if (isSaved) {
                //response.sendRedirect("unidadMedidaList"); // Redirige al servlet que muestra la lista
                response.sendRedirect("unidadMedida.jsp");
            } else {
                System.out.println("no se escribio ela unidad de medida en la bd");
            }

    }
}
