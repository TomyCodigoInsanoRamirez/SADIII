<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="mx.edu.utez.saditarea.modelo.RegistroEntradas" %>
<%@ page import="mx.edu.utez.saditarea.dao.SalidasDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.registro_salida" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saditarea.modelo.RegistroProductoSalida" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProductosDao" %>
<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.dao.AreasDao" %>

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
        /* Reducir el espacio entre el encabezado y las tablas */
        h2 {
            margin-bottom: 5px;
        }
        .table-responsive {
            margin-top: 5px;
        }
    </style>
</head>

<%
    String folio = request.getParameter("folio");
    System.out.println("OBTENER FOLIOOOOOOOOOOOOOOOOOOO: "+folio);
    SalidasDao salidaa = new SalidasDao();
    registro_salida salida = salidaa.datosSalida(folio);
    List<RegistroProductoSalida> producByFolio = salidaa.producByFolio(folio);
    //registro_salida a =new registro_salida();
    ProductosDao productosDao = new ProductosDao();
    UserDao userDao = new UserDao();
    AreasDao areasDao = new AreasDao();
%>
<body>
<div class="d-flex">
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px">
                <a id="loginImg" href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
            </a>
            <div class="tituloSeccion">
                <h1>Información de la salida</h1>
            </div>
            <div class="collapse navbar-collapse" id="navbarsExample07XL">
                <ul class="navbar-nav mr-auto"></ul>
                <div class="log">
                    <a href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                </div>
            </div>
        </nav>
        <div class="container">
            <!-- Botón para regresar -->
            <div class="d-flex justify-content-start mb-2">
                <a href="javascript:history.back()" class="btn btn-primary">Regresar</a>
            </div>

            <!-- Primera tabla para visualizar datos -->
            <div class="table-responsive">
                <h2 class="text-center">Datos de la salida</h2>
                <table class="table table-bordered table-striped" style="margin-top: -0.1%">
                    <thead>
                    <tr>
                        <th>Folio</th>
                        <th>Fecha entrada</th>
                        <th>Area</th>
                        <th>Almacenista que recibe</th>
                        <th>Almacenista que envia</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><%=salida.getFolio_salida()%></td>
                        <td><%=salida.getFecha_entrada()%></td>
                        <td><%=areasDao.getNameArea(salida.getArea())%></td>
                        <td><%=userDao.getName(Integer.parseInt(salida.getFk_almacenistaR()))%></td>
                        <td><%=userDao.getName(Integer.parseInt(salida.getFk_almacenistaR()))%></td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <!-- Segunda tabla para visualizar productos ingresados -->
            <div class="table-responsive">
                <h2 class="text-center">Productos </h2>
                <table class="table table-bordered table-striped" style="margin-top: -0.1%">
                    <thead>
                    <tr>
                        <th>Producto</th>
                        <th>Unidad de medida</th>
                        <th>Cantidad</th>
                        <th>Precio unitario</th>
                        <th>Precio Total</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        for(RegistroProductoSalida a : producByFolio){
                    %>
                    <tr>
                        <td><%=productosDao.getNameProd(a.getFk_producto_salida())%></td>
                        <td><%=a.getUnidadMedidaS()%></td>
                        <td><%=a.getCantidad()%></td>
                        <td><%=a.getPrecio_unitario_prod_salida()%></td>
                        <td><%=a.getCantidad() * a.getPrecio_unitario_prod_salida()%></td>
                    </tr>
                    <%
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
