<%@ page import="mx.edu.utez.saditarea.dao.UnidadMedidaDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.UnidadMedida" %>
<link rel="icon" href="img/apple-touch-icon.png" type="image/png">

<%
    // Obtener datos del formulario
    String abreviacionUnidadMedida = request.getParameter("abreviacion");
    String nombreUnidadMeidida = request.getParameter("nombre");

    // Crear objeto UnidadMedida con los datos del formulario
    UnidadMedida unidadMedida = new UnidadMedida(abreviacionUnidadMedida, nombreUnidadMeidida);

    // Crear instancia del DAO para actualizar la unidad de medida
    UnidadMedidaDao dao = new UnidadMedidaDao();
    boolean actualizado = dao.update(unidadMedida);

    // Redirigir a la lista de unidades de medida después de la actualización
    if (actualizado) {
        response.sendRedirect("unidadMedida.jsp");
    } else {
        System.out.println("Error al actualizar la unidad de medida.");
    }
%>
