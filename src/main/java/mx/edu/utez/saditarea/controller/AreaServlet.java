package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.AreasDao;
import mx.edu.utez.saditarea.modelo.Areas;

import java.io.IOException;

@WebServlet(name = "AreaServlet", urlPatterns = {"/AreaServlet"})
public class AreaServlet extends HttpServlet {

    private AreasDao areasDao = new AreasDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el tipo de operación (agregar o actualizar)
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            // Obtener los parámetros del formulario para agregar
            String claveArea = request.getParameter("claveArea");
            String nombreArea = request.getParameter("nombreArea");
            String descripcionArea = request.getParameter("descripcionArea");
            int estadoAr = Integer.parseInt(request.getParameter("estadoAr"));

            // Crear un nuevo objeto Areas
            Areas nuevaArea = new Areas();
            nuevaArea.setClaveArea(claveArea);
            nuevaArea.setNombreArea(nombreArea);
            nuevaArea.setDescripcionArea(descripcionArea);
            nuevaArea.setEstadoAr(estadoAr);
            String rutaaa = "";
            // Agregar la nueva área
            //areasDao.save(nuevaArea);
            if(areasDao.save(nuevaArea)){
                rutaaa = "areas.jsp";
            }else{
                rutaaa = "hola.jsp";
            }
            // Redirigir a la página de éxito
            response.sendRedirect(rutaaa);

        } else if ("actualizar".equals(action)) {
            // Obtener los parámetros del formulario para actualizar
            String claveArea = request.getParameter("claveArea");
            String nombreArea = request.getParameter("nombreArea");
            String descripcionArea = request.getParameter("descripcionArea");

            // Crear un objeto Areas con los datos actualizados
            Areas areaActualizada = new Areas();
            areaActualizada.setClaveArea(claveArea);
            areaActualizada.setNombreArea(nombreArea);
            areaActualizada.setDescripcionArea(descripcionArea);

            // Actualizar el área
            boolean actualizado = areasDao.update(areaActualizada);

            if (actualizado) {
                // Redirigir a la página de éxito
                response.sendRedirect("areas.jsp");
            } else {
                // Manejar el error
                response.getWriter().print("Error al actualizar el área.");
            }
        } else {
            // Acción no reconocida
            response.getWriter().print("Acción no válida.");
        }
    }
}
