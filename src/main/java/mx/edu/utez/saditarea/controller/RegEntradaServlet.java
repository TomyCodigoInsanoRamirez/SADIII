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
@WebServlet(name = "RegEntradaServlet",value = "/regEntrada")
public class RegEntradaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener la cadena JSON desde el formulario
        String jsonArray = request.getParameter("data");
        System.out.println("NUEVO SERVLET");
        // Convertir la cadena JSON a un array de arrays
        Gson gson = new Gson();
        String[][] arrayOfArrays = gson.fromJson(jsonArray, String[][].class);
        RegistroEntradas regE = new RegistroEntradas();
        RegistroProductoEntrada regEP = new RegistroProductoEntrada();
        EntradasDao dao = new EntradasDao();

        int contador = 1;
        int contadorRegistro = 1;
        String ruta = "";
        // Imprimir los elementos en consola
        for (String[] array : arrayOfArrays) {
            for (String item : array) {
                System.out.println(item);
                switch (contador){
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
                            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd ");
                            fecha = formatoFecha.parse(item);
                        } catch (ParseException e) {
                            e.printStackTrace(); // Maneja la excepción aquí, por ejemplo, mostrando un mensaje de error.
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

            if(contadorRegistro<=1){
                boolean sehizo = dao.save2(regE);
                if(sehizo){
                    System.out.println("Si se insertaron los datos correctamente, de la entrada");
                    ruta = "entradas.jsp";
                }else{
                    System.out.println("No se insertaron los datos correctamente, de la entrada");
                }
            }
            dao.save3(regEP);
            System.out.println("CHECA EN LA BD SI YA SE REGISTRARON LAS ENTRADAS");

            contadorRegistro++;
        }
        System.out.println("NOs vamos para "+ruta);
        response.sendRedirect(ruta);
        contador = 0;
    }
    /*
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }

        String jsonData = sb.toString();

        Gson gson = new Gson();
        try {
            String[][] data = gson.fromJson(jsonData, String[][].class);

            // Imprimir el arreglo de arreglos en consola
            for (String[] array : data) {
                for (String item : array) {
                    System.out.println(item);
                }
            }
        } catch (JsonSyntaxException e) {
            System.out.println("Error al parsear JSON: " + e.getMessage());
        }
    }

     */
}
