package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;

import java.io.IOException;

@WebServlet(name = "RegistroUnidadMedidaServlet" , value = "/registroUnidadMedida")
public class RegistroUnidadMedidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String abreviacionUndidadMedida = request.getParameter("product-key");
        String nombreUnidadMedida = request.getParameter("product-name");

        UnidadMedida unidadMedida = new UnidadMedida(abreviacionUndidadMedida, nombreUnidadMedida);
        UnidadMedidaDao unidadMedidaDao = new UnidadMedidaDao();

        boolean isSaved = unidadMedidaDao.save(unidadMedida);

        if (isSaved) {
            response.sendRedirect("unidadMedida.jsp"); // Redirige a una página de éxito
        } else {
            response.sendRedirect("error.jsp"); // Redirige a una página de error
        }
    }
}
