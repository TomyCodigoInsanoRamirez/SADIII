package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.EntradasDao;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Entradas;
import mx.edu.utez.saditarea.modelo.Usuario;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;

@WebServlet(name = "RegistrarEntradas", value = "/registrarEntrada")
public class RegistrarEntradas extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
/*
        String folio = request.getParameter("folio-E");
        String nombreProveedor = request.getParameter("nombreCompleto");
        String nombreAlmacenista = request.getParameter("nombreCompletoAlmacenista");
        String unidadMedida =request.getParameter("unit");
        String precioUnitarioo = request.getParameter("unit-price");
        float precioUnitario = Float.parseFloat(precioUnitarioo);
        String numeroFacturacon = request.getParameter("billing-number");
        String fechaEntradaa = request.getParameter("entry-date");

        String producto = request.getParameter("product");
        String cantidad = request.getParameter("quantity");
        String precioTotall = request.getParameter("total-price");
        float precioTotal = Float.parseFloat(precioTotall);

       // Entradas entrada = new Entradas();
        EntradasDao dao = new EntradasDao();
        Entradas entrada = new Entradas(folio,numeroFacturacon,fechaEntrada,nombreProveedor,precioUnitario,precioTotal,cantidad,producto,nombreAlmacenista,unidadMedida);
        //boolean isSave = dao.save(entrada);

*/

    }
}
