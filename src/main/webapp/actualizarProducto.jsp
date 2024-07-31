<%@ page import="mx.edu.utez.saditarea.dao.ProductosDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Productos" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    System.out.println("SE RECIBEN LOS DATOS EN ACTUALIZAR PRODUCTO");
    String claveProducto = request.getParameter("claveProducto");
    String nombreProducto = request.getParameter("nombreProducto");
    String descripcionProducto = request.getParameter("descripcionProducto");
    String estadoProductoStr = request.getParameter("estadoProducto");

    // Maneja el caso en que el estadoProducto no se proporciona en el formulario
    int estadoProducto = estadoProductoStr != null ? Integer.parseInt(estadoProductoStr) : 1;

    // Crea el objeto Productos con todos los parámetros
    Productos producto = new Productos(claveProducto, nombreProducto, descripcionProducto, estadoProducto);

    // Obtén el DAO y actualiza el producto
    ProductosDao dao = new ProductosDao();
    boolean actualizado = dao.update(producto);

    // Redirige a la página de productos o muestra un mensaje de error
    if (actualizado) {
        response.sendRedirect("productos.jsp"); // Cambia a la página que muestra la lista de productos
    } else {
        System.out.println("<p>Error al actualizar el producto</p>");
    }
%>
