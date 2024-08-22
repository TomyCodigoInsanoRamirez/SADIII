<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProveedoresDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Proveedores" %>
<link rel="icon" href="img/apple-touch-icon.png" type="image/png">

<%
    // Obtener parámetros del formulario
    String RFC = request.getParameter("RFC");
    String razonSocial = request.getParameter("razonSocial");
    String nombreProveedor1 = request.getParameter("nombreProveedor1");
    String nombreProveedor2 = request.getParameter("nombreProveedor2");
    String apellidoProveedor1 = request.getParameter("apellido1");
    String apellidoProveedor2 = request.getParameter("apellido2");
    String telefonoProveedor = request.getParameter("telefonoProveedor");
    String telefonoAdicional = request.getParameter("telefonoA");
    String nombreA1 = request.getParameter("nombreA1");
    String nombreA2 = request.getParameter("nombreA2");
    String apellidoA1 = request.getParameter("apellidoA1");
    String apellidoA2 = request.getParameter("apellidoA2");
    String direccionProveedor = request.getParameter("direccion");
    String cp = request.getParameter("cp");
    String estadoS = request.getParameter("estado");
    int estado = Integer.parseInt(estadoS);

    // Crear un objeto Proveedores y asignar valores
    Proveedores proveedor = new Proveedores();
    proveedor.setRFC(RFC);
    proveedor.setRazon_social(razonSocial);
    proveedor.setNombre1_P(nombreProveedor1);
    proveedor.setNombre2_P(nombreProveedor2);
    proveedor.setApellido1_P(apellidoProveedor1);
    proveedor.setApellido2_P(apellidoProveedor2);
    proveedor.setTelefono_P(telefonoProveedor);
    proveedor.setTelefono_Adicional(telefonoAdicional);
    proveedor.setNombre1_Adicional(nombreA1);
    proveedor.setNombre2_Adicional(nombreA2);
    proveedor.setApellido1_Adicional(apellidoA1);
    proveedor.setApellido2_Adicional(apellidoA2);
    proveedor.setDireccion(direccionProveedor);
    proveedor.setCodigo_postal(cp);
    proveedor.setEstado_usu(estado);

    // Llamar al DAO para actualizar el proveedor
    ProveedoresDao dao = new ProveedoresDao();
    boolean actualizado = dao.update(proveedor);

    // Redireccionar o mostrar mensaje de error
    if (actualizado) {
        response.sendRedirect("provedores.jsp"); // Cambiar a la página que muestra la lista de proveedores
    } else {
        System.out.println("<script>alert('Error al actualizar el proveedor.'); window.location.href='index.jsp';</script>");
    }
%>
