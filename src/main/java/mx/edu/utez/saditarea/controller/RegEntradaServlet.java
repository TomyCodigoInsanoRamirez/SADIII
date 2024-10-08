package mx.edu.utez.saditarea.controller;
import java.io.BufferedReader;
import java.io.Console;
import java.io.IOException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.EntradasDao;
import mx.edu.utez.saditarea.modelo.RegistroEntradas;
import mx.edu.utez.saditarea.modelo.RegistroProductoEntrada;

/*
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
*/
@WebServlet(name = "RegEntradaServlet", value = "/regEntrada")
public class RegEntradaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String jsonArray = request.getParameter("data");
        Gson gson = new Gson();
        String[][] arrayOfArrays = gson.fromJson(jsonArray, String[][].class);
        RegistroEntradas regE = new RegistroEntradas();
        EntradasDao dao = new EntradasDao();

        int contador = 1;
        int contadorRegistro = 1;
        String ruta = "";

        for (String[] array : arrayOfArrays) {
            RegistroProductoEntrada regEP = new RegistroProductoEntrada();
            contador = 1;
            for (String item : array) {
                switch (contador) {
                    case 1:
                        regE.setFolioEntrada(item);
                        regEP.setFkFolio(item);
                        break;
                    case 2:
                        regE.setFkRFCProveedor(item);
                        break;
                    case 3:
                        regE.setFkEmpleado(item);
                        break;
                    case 4:
                        regEP.setUnidadMedidaE(item);
                        break;
                    case 5:
                        regEP.setPrecioUnitarioProd(Double.parseDouble(item));
                        break;
                    case 6:
                        regE.setNumeroFacturaE(item);
                        break;
                    case 7:
                        Date fecha = new Date();
                        try {
                            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
                            fecha = formatoFecha.parse(item);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        regE.setFechasEntrada(fecha);
                        break;
                    case 8:
                        regEP.setFkProducto(item);
                        break;
                    case 9:
                        regEP.setCantidad(Integer.parseInt(item));
                        break;
                    case 10:
                        regE.setPrecioTotal(Double.parseDouble(item));
                        regEP.setPrecioTotalP(Double.parseDouble(item));
                        break;
                }
                contador++;
            }

            if (contadorRegistro == 1) {
                boolean sehizo = dao.save2(regE);
                if (sehizo) {
                    ruta = "entradas.jsp";
                } else {
                }
            }
            contadorRegistro++;

            dao.save3(regEP);
        }

        response.sendRedirect(ruta);
    }
}