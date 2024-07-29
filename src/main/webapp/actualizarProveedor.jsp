<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProveedoresDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Proveedores" %>

<%
    String RFC = request.getParameter("RFC");
    String nombreProveedor = request.getParameter("nombreProveedor");
    String telefonoProveedor = request.getParameter("telefonoProveedor");

    ProveedoresDao dao = new ProveedoresDao();
    Proveedores proveedor = new Proveedores();
    proveedor.setRFC(RFC);
    proveedor.setNombre1_P(nombreProveedor);
    proveedor.setTelefono_P(telefonoProveedor);

    boolean actualizado = dao.update(proveedor);

    if (actualizado) {
        response.sendRedirect("provedores.jsp");
    } else {
        System.out.println("<script>alert('Error al actualizar el proveedor.'); window.location.href='index.jsp';</script>");
    }
%>
