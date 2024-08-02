package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.SalidasDao;
import mx.edu.utez.saditarea.modelo.Salidas;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegistroSalidasServlet", value = "/registroSalidas")
public class RegistroSalidasServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String folio = req.getParameter("folio_S");
        //int empleadoS = Integer.parseInt(req.getParameter("empleado_S"));
        String empleadoS = req.getParameter("empleado_S");
        String empleadoE = req.getParameter("receiver-name");
       // int empleadoE = Integer.parseInt(req.getParameter("empleado_E"));
        String area = req.getParameter("area");
        String fechaStr = req.getParameter("fecha");
        int cantidad = Integer.parseInt(req.getParameter("cantidad_S"));
        String claveProducto = req.getParameter("claveProducto");
        String unidadMedida = req.getParameter("unidadMedida");

        System.out.println(folio);
        System.out.println(empleadoS);
        System.out.println(empleadoE);
        System.out.println(area);
        System.out.println(fechaStr);
        System.out.println(cantidad);
        System.out.println(claveProducto);
        System.out.println(unidadMedida);

        // Convertir la fecha
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = null;
        try {
            fecha = sdf.parse(fechaStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // Crear el objeto Salidas
        Salidas salida = new Salidas(folio, empleadoS, empleadoE, area, fecha, cantidad, claveProducto, unidadMedida);

        // Obtener la sesión y el DAO
        HttpSession sesion = req.getSession();
        SalidasDao dao = new SalidasDao();

        // Guardar la salida en la base de datos
        boolean resultado = dao.save(salida);

        String ruta = "index.jsp";
        if (resultado) {
            sesion.setAttribute("mensaje", "Salida registrada correctamente");
            ruta = "salidas.jsp";
        } else {
            sesion.setAttribute("mensaje", "Error al registrar la salida");
            ruta = "index.jsp?error=true";
        }

        resp.sendRedirect(ruta);
    }

    @Override
    public void destroy() {
    }
}
