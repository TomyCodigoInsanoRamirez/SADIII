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
import mx.edu.utez.saditarea.dao.SalidasDao;
import mx.edu.utez.saditarea.modelo.RegistroEntradas;
import mx.edu.utez.saditarea.modelo.RegistroProductoEntrada;
import mx.edu.utez.saditarea.modelo.RegistroProductoSalida;
import mx.edu.utez.saditarea.modelo.registro_salida;

/*
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
*/
@WebServlet(name = "RegSalidasServlet",value = "/regSalidas")
public class RegSalidaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Obtener la cadena JSON desde el formulario
        String jsonArray = request.getParameter("data");
        System.out.println("NUEVO SERVLET");
        // Convertir la cadena JSON a un array de arrays
        Gson gson = new Gson();
        String[][] arrayOfArrays = gson.fromJson(jsonArray, String[][].class);
        registro_salida regS = new registro_salida();
        RegistroProductoSalida regSoP = new RegistroProductoSalida();
        SalidasDao dao = new SalidasDao();

        int contador = 1;
        int contadorRegistro = 1;
        String ruta = "";
        // Imprimir los elementos en consola
        for (String[] array : arrayOfArrays) {
            RegistroProductoSalida  regSP = new RegistroProductoSalida();
            contador = 1;
            for (String item : array) {
                System.out.println(item);
                switch (contador){
                    case 1:
                        regS.setFolio_salida(item);
                        regSP.setFk_folio_salida(item);
                        break;
                    case 2:
                        regS.setFk_almacenistaR(item);
                        break;
                    case 3:
                        regS.setFk_almacenistaE(item);
                        break;
                    case 4:
                        Date fecha = new Date();
                        try {
                            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy-MM-dd");
                            fecha = formatoFecha.parse(item);
                        } catch (ParseException e) {
                            e.printStackTrace(); // Maneja la excepción aquí, por ejemplo, mostrando un mensaje de error.
                        }
                        regS.setFecha_entrada(fecha);
                        /*regSP.setFk_producto_salida(item);*/
                        break;
                    case 5:
                        regSP.setFk_producto_salida(item);
                       /*regSP.setPrecio_unitario_prod_salida(Double.parseDouble(item));*/
                        break;
                    case 6:
                        regSP.setUnidadMedidaS(item);
                        break;
                    case 7:
                        regSP.setPrecio_unitario_prod_salida(Double.parseDouble(item));

                        break;
                    case 8:
                        regS.setArea(item);
                        break;
                    case 9:
                        regSP.setCantidad(Integer.parseInt(item));
                        break;

                }
                contador++;
            }

            if(contadorRegistro<=1){
                boolean sehizo = dao.save2(regS);
                if(sehizo){
                    System.out.println("Si se insertaron los datos correctamente, de la entrada");
                    ruta = "salidas.jsp";
                }else{
                    System.out.println("No se insertaron los datos correctamente, de la entrada");
                }
            }
            dao.save3(regSP);
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
