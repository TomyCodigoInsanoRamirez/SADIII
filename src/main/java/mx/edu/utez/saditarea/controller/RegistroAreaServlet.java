package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.AreasDao;
import mx.edu.utez.saditarea.modelo.Areas;

import java.io.IOException;

@WebServlet(name = "RegistroAreaServlet", value = "/registroArea")
public class RegistroAreaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreArea = request.getParameter("product-name");
        String descripcionArea = request.getParameter("description");

        Areas area = new Areas(nombreArea, descripcionArea);
        AreasDao areasDao = new AreasDao();

        boolean isSaved = areasDao.save(area);

        if (isSaved) {
            response.sendRedirect("home.jsp"); // Redirige a una página de éxito
        } else {
            response.sendRedirect("error.jsp"); // Redirige a una página de error
        }
    }
}
