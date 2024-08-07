package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.EntradasDao;
import mx.edu.utez.saditarea.modelo.Entradas;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegistroEntradasServlet", value = "/registroEntradas")
public class RegistroEntradasServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String folioE = req.getParameter("folio-E");
        String numeroFactura = req.getParameter("billing-number");
        String fechaStr = req.getParameter("entry-date");
        String rfc = req.getParameter("nombreCompleto");
        String precioUnitarioo = req.getParameter("unit-price");
        float precioUnitario = Float.parseFloat(precioUnitarioo);
        String precioTotall = req.getParameter("total-price");
        float precioTotal = Float.parseFloat(precioTotall);
        int cantidad = Integer.parseInt(req.getParameter("quantity"));
        String claveProducto = req.getParameter("product");
        String nombreAlmacenista = req.getParameter("nombreCompletoAlmacenista");
        String unidadMedida = req.getParameter("unit");
        // Convertir la fecha
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        try {
            fecha = sdf.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Crear el objeto Entradas
        //Entradas entrada = new Entradas(folioE, numeroFactura, fecha, rfc, precioUnitario, precioTotal, claveProducto, idEmpleado, unidadMedida);
        Entradas entrada = new Entradas(folioE,numeroFactura,fecha,rfc,precioUnitario,precioTotal,cantidad,claveProducto,nombreAlmacenista,unidadMedida);
        // Obtener la sesión y el DAO
        HttpSession sesion = req.getSession();
        EntradasDao dao = new EntradasDao();

        // Guardar la entrada en la base de datos
        boolean resultado = dao.save(entrada);

        String ruta = "index.jsp";
        if (resultado) {
            sesion.setAttribute("mensaje", "Entrada registrada correctamente");
            ruta = "entradas.jsp";
        } else {
            sesion.setAttribute("mensaje", "Error al registrar la entrada");
            ruta = "index.jsp?error=true";
        }

        resp.sendRedirect(ruta);
    }

    @Override
    public void destroy() {
    }
}
