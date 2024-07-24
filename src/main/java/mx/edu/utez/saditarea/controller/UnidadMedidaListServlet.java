package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "UnidadMedidaListServlet", value = "/unidadMedidaList")
public class UnidadMedidaListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UnidadMedidaDao unidadMedidaDao = new UnidadMedidaDao();
        List<UnidadMedida> unidadesMedida = unidadMedidaDao.getAll();

        request.setAttribute("unidadesMedida", unidadesMedida);
        request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
    }
}
