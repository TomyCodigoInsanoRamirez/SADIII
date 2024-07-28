package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;

import java.io.IOException;

@WebServlet(name = "RegistroUnidadMedidaServlet", value = "/registroUnidadMedida")
public class RegistroUnidadMedidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String abreviacionUndidadMedida = request.getParameter("abreviacionUnidadMedida");
        String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");

        UnidadMedida unidadMedida = new UnidadMedida(abreviacionUndidadMedida, nombreUnidadMedida,1);
        UnidadMedidaDao unidadMedidaDao = new UnidadMedidaDao();

        boolean isSaved = unidadMedidaDao.save(unidadMedida);

        if (isSaved) {
            response.sendRedirect("unidadMedidaList"); // Redirige al servlet que muestra la lista
        } else {
            request.setAttribute("message", "Error al registrar la unidad de medida.");
            request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
        }
    }
}
