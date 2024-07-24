package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.AreasDao;
import mx.edu.utez.saditarea.modelo.Areas;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RegistroAreaServlet", value = "/mostrarAreas")
public class RegistroAreaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AreasDao areasDao = new AreasDao();
        List<Areas> areasList = areasDao.getAll();

        request.setAttribute("areasList", areasList);
        request.getRequestDispatcher("areas.jsp").forward(request, response);
    }
}
