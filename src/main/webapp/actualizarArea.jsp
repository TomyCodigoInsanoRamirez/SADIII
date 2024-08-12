<%@ page import="mx.edu.utez.saditarea.dao.AreasDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Areas" %>
<link rel="icon" href="img/apple-touch-icon.png" type="image/png">

<%
    if(session.getAttribute("tipoSesion") == null||session.getAttribute("tipoSesion") == "") {
        response.sendRedirect("error.jsp");
        return;}
%>
<%
    // Obtener datos del formulario
    String claveArea = request.getParameter("claveArea");
    String nombreArea = request.getParameter("nombreArea");
    String descripcionArea = request.getParameter("descripcionArea");

    // Crear objeto Areas con los datos del formulario
    Areas area = new Areas();
    area.setClaveArea(claveArea);
    area.setNombreArea(nombreArea);
    area.setDescripcionArea(descripcionArea);

    // Crear instancia del DAO para actualizar el área
    AreasDao dao = new AreasDao();
    boolean actualizado = dao.update(area);

    // Redirigir a la lista de áreas después de la actualización
    if (actualizado) {
        response.sendRedirect("areas.jsp");
    } else {
        System.out.println("Error al actualizar el área.");
    }
%>
