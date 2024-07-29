package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.saditarea.dao.UnidadMedidaDao;
import mx.edu.utez.saditarea.modelo.UnidadMedida;

import java.io.IOException;

@WebServlet(name = "RegistroUnidadMedidaServlet", value = {"/registroUnidadMedida", "/actualizarUnidadMedida"})
public class RegistroUnidadMedidaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // Determina la acción a realizar
        UnidadMedidaDao unidadMedidaDao = new UnidadMedidaDao();

        if ("register".equals(action)) {
            // Registro de unidad de medida
            String abreviacionUnidadMedida = request.getParameter("abreviacionUnidadMedida");
            String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");

            // Usa el constructor para nuevos registros
            UnidadMedida unidadMedida = new UnidadMedida(abreviacionUnidadMedida, nombreUnidadMedida, 1);
            boolean isSaved = unidadMedidaDao.save(unidadMedida);

            if (isSaved) {
                response.sendRedirect("unidadMedidaList"); // Redirige al servlet que muestra la lista
            } else {
                request.setAttribute("message", "Error al registrar la unidad de medida.");
                request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
            }
        } else if ("update".equals(action)) {
            // Actualización de unidad de medida
            String idStr = request.getParameter("id");
            String abreviacionUnidadMedida = request.getParameter("abreviacionUnidadMedida");
            String nombreUnidadMedida = request.getParameter("nombreUnidadMedida");

            // Verifica si el ID está presente y es numérico
            if (idStr != null && !idStr.isEmpty()) {
                try {
                    // Aquí, se asume que el ID puede no ser necesario y simplemente se usa el identificador de abreviación.
                    // Actualiza la unidad de medida existente.
                    UnidadMedida unidadMedida = new UnidadMedida(abreviacionUnidadMedida, nombreUnidadMedida, 1); // Aquí estado es 1 por default o puede ser el mismo estado anterior
                    boolean isUpdated = unidadMedidaDao.update(unidadMedida);

                    if (isUpdated) {
                        response.sendRedirect("unidadMedidaList"); // Redirige al servlet que muestra la lista
                    } else {
                        request.setAttribute("message", "Error al actualizar la unidad de medida.");
                        request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    request.setAttribute("message", "ID de unidad de medida inválido.");
                    request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", "ID de unidad de medida no proporcionado.");
                request.getRequestDispatcher("unidadMedida.jsp").forward(request, response);
            }
        } else {
            // Manejo de errores o acciones no reconocidas
            response.sendRedirect("unidadMedida.jsp");
        }
    }
}
