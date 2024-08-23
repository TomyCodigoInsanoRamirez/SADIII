<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.saditarea.modelo.RegistroProductoEntrada" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProductosDao" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saditarea.modelo.RegistroEntradas" %>

<%
    String folio = request.getParameter("folio");
    if (folio != null) {
        System.out.println("Folio recibido: " + folio); // Depuración

        ProductosDao dao = new ProductosDao();

        List<RegistroEntradas> entradasList = dao.producByFolio0(folio);
        request.setAttribute("entradasList", entradasList);

        List<RegistroProductoEntrada> productos = dao.producByFolio(folio);
        request.setAttribute("productos", productos);
    } else {
        System.out.println("No se proporcionó un folio válido.");
    }
%>

<html lang="es">

<head>
    <title>Visualizar</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="icon" href="img/apple-touch-icon.png" type="image/png">
    <style>
        h2 {
            margin-bottom: 5px;
        }

        .table-responsive {
            margin-top: 5px;
        }
    </style>
</head>

<body>
<div class="d-flex">
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px">
                <a id="loginImg" href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
            </a>
            <div class="tituloSeccion">
                <h1>Información de la entrada</h1>
            </div>
            <div class="collapse navbar-collapse" id="navbarsExample07XL">
                <ul class="navbar-nav mr-auto"></ul>
                <div class="log">
                    <a href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="d-flex justify-content-start mb-2">
                <a href="javascript:history.back()" class="btn btn-primary">Regresar</a>
            </div>

            <div class="table-responsive">
                <h2 class="text-center">Entradas</h2>
                <table class="table table-bordered table-striped" style="margin-top: -0.1%">
                    <thead>
                    <tr>
                        <th>Folio</th>
                        <th>Número Factura</th>
                        <th>Fecha</th>
                        <th>RFC Proveedor</th>
                        <th>Precio Total</th>
                        <th># Empleado</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<RegistroEntradas> entradasList = (List<RegistroEntradas>) request.getAttribute("entradasList");
                        int contadorMayor1 = 0;
                        if (entradasList != null && !entradasList.isEmpty()) {
                            for (RegistroEntradas entrada : entradasList) {

                                if(contadorMayor1 < 1){
                    %>
                    <tr>
                        <td><%= entrada.getFolioEntrada() %></td>
                        <td><%= entrada.getNumeroFacturaE() %></td>
                        <td><%= entrada.getFechasEntrada() %></td>
                        <td><%= entrada.getFkRFCProveedor() %></td>
                        <td><%= entrada.getPrecioTotal() %></td>
                        <td><%= entrada.getFkEmpleado() %></td>
                    </tr>
                    <%
                        }
                            contadorMayor1++;
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="6" class="text-center">No se encontraron entradas para el folio: <%= folio %>.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>

            <div class="table-responsive">
                <h2 class="text-center">Datos de los Productos</h2>
                <table class="table table-bordered table-striped" style="margin-top: -0.1%">
                    <thead>
                    <tr>
                        <th>Clave Producto</th>
                        <th>Precio Unitario</th>
                        <th>Precio Total</th>
                        <th>Cantidad</th>
                        <th>Unidad de Medida</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        List<RegistroProductoEntrada> productos = (List<RegistroProductoEntrada>) request.getAttribute("productos");
                        if (productos != null && !productos.isEmpty()) {
                            for (RegistroProductoEntrada producto : productos) {
                    %>
                    <tr>
                        <td><%= producto.getFkProducto() %></td>
                        <td><%= producto.getPrecioUnitarioProd() %></td>
                        <td><%= producto.getPrecioTotalP() %></td>
                        <td><%= producto.getCantidad() %></td>
                        <td><%= producto.getUnidadMedidaE() %></td>
                    </tr>
                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="5" class="text-center">No se encontraron productos para el folio: <%= folio %>.</td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>
