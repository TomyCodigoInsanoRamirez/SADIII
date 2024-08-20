<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>

<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProductosDao" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Productos" %>
<%@ page import="mx.edu.utez.saditarea.modelo.UnidadMedida" %>
<%@ page import="mx.edu.utez.saditarea.dao.UnidadMedidaDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    UnidadMedidaDao daoUnidadM = new UnidadMedidaDao();
    List<UnidadMedida> unidadMedida= daoUnidadM.getAll();
%>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SADI</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">
    <link rel="icon" href="img/apple-touch-icon.png" type="image/png">


</head>
<style>
    .table-wrapper {
        position: relative;
    }
    .custom-color {
        color: #28a745;
    }
    #agregar-productos{

    }
    .add-button {
        display: flex;
        border-radius: 50%;
        font-size: 3.3rem;
        border: none;
    }
    button:focus {
        outline: none;
        box-shadow: none; /* También elimina cualquier sombra que pueda aparecer */
    }
    .icon-hover {

        transition: color 0.3s, transform 0.3s;
    }
    .icon-hover:hover {
        transform: scale(1.2); /* Aumenta el tamaño del icono al pasar el cursor */
    }
    .alert1 {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        position: fixed;
        top: 14%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1050; /* sobrepasa los otros elementos */
    }

</style>
<%
    String message = (String) session.getAttribute("message");
    if ("success".equals(message)) {
%>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        Swal.fire({
            icon: 'success',
            title: 'Éxito',
            text: 'El producto se ha registrado correctamente.',
            confirmButtonText: 'Aceptar'
        });
    });
</script>
<%
    // Elimina el atributo de sesión después de mostrar la alerta
    session.removeAttribute("message");
}
else if ("error_producto_existente".equals(message)) {
%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Swal.fire({
            icon: 'error',
            title: 'Error',
            text: 'El producto ya existe en la base de datos.',
            confirmButtonText: 'Aceptar'
        });
    });
</script>
<%
        // Elimina el atributo de sesión después de mostrar la alerta
        session.removeAttribute("message");
    }
%>
<script>

    let apagados = 0;
    let clikis = 0;


    document.addEventListener('DOMContentLoaded', function () {
        // Función para ocultar la alerta después de 6 segundos
        function hideAlertAfterTimeout(alertId) {
            var alertElement = document.getElementById(alertId);
            if (alertElement) {
                setTimeout(function () {
                    $(alertElement).alert('close');
                }, 9000); // 9 segundos
            }
        }

        // Llamar a la función para ambas alertas, si existen
        hideAlertAfterTimeout('alert-success');
        hideAlertAfterTimeout('alert-error');
    });
</script>


<body>


<script>
    document.addEventListener('DOMContentLoaded', () => {
        // Establecer el estado del slider al cargar la página
        document.querySelectorAll('.inn').forEach(input => {
            if (input.dataset.estado == 1) {
                input.checked = true;
            }
            input.addEventListener('click', () => toggleSlider(input));
        });
    });

    function toggleSlider(element) {
        const isChecked = element.checked;
        const action = isChecked ? 'activar' : 'desactivar';
        const title = isChecked ? '¿Estás seguro de activar el producto?' : '¿Estás seguro de desactivar el producto?';
        const confirmButtonText = isChecked ? 'Sí, activar!' : 'Sí, desactivar!';
        const cancelButtonText = isChecked ? 'No, cancelar!' : 'No, cancelar!';

        // Mostrar la alerta con SweetAlert2
        Swal.fire({
            title: title,
            text: "Esta acción se puede revertir.",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: confirmButtonText,
            cancelButtonText: cancelButtonText,
            reverseButtons: true,
            customClass: {
                confirmButton: 'btn btn-success',
                cancelButton: 'btn btn-danger'
            },
            buttonsStyling: false,
            allowOutsideClick: false,
            allowEscapeKey: false,
            allowEnterKey: false
        }).then((result) => {
            if (result.isConfirmed) {
                // Enviar solicitud al servidor para actualizar el estado
                window.location.href = element.parentElement.querySelector('a').href;
            } else if (result.dismiss === Swal.DismissReason.cancel) {
                // Revertir el estado del checkbox si el usuario cancela
                element.checked = !isChecked;
                Swal.fire({
                    title: 'Cancelado',
                    text: 'La acción ha sido cancelada.',
                    icon: 'error'
                });
            }
        });
    }

</script><!--Alert para la desactivacion de productos-->
<%
    String action = request.getParameter("action");
%>
<script>
    document.addEventListener('DOMContentLoaded', (event) => {
        // Verifica si 'action' no es null y tiene un valor
        const action = '<%= action != null ? action : "" %>';
        if (action !== '') {
            Swal.fire({
                title: action === "activado" ? "Activado!" : "Desactivado!",
                text: 'El producto ha sido ' + action + '.',
                icon: 'success'
            }).then(() => {
                // Elimina el parámetro 'action' de la URL sin recargar la página
                const url = new URL(window.location);
                url.searchParams.delete('action');
                window.history.replaceState(null, null, url);
            });
        }
    });

</script>

<div id="capa-obscurecer">

</div>

<div class="d-flex " style="">
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <a id="logoImg" href=""><img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px" ></a>
                <a id="loginImg" href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                <div class="hbs"><a href="" id="hbsb"><img src="img/hbs.png" width="50px"></a></div>
                <div class="tituloSeccion">
                    <h1>PRODUCTOS</h1>
                </div>
                <div id="sidebar-responsive" class="h-100">
                    <!--<div class="hbs"><img src="img/hbs.png" width="50px"></div>-->
                    <div id="sidebar-accordion-responsive" class="accordion" style="width: 70%;">
                        <div class="list-group " style="margin-top: 10px;">
                            <a href="#dashboard-items" data-toggle="collapse" aria-expanded="false"
                               class="list-group-item list-group-item-action text-light mb-2 item-list-res" id="item-responsive">
                                <i class="bi bi-collection-fill mr-3 " aria-hidden="true" ></i>Catálogos
                            </a>
                            <div id="dashboard-items-responsive" class="collapse" data-parent="#sidebar-accordion">
                                <%
                                    if(session.getAttribute("tipoSesion").equals("admin")){
                                %>
                                <a href="home.jsp"
                                   class="list-group-item list-group-item-action bg-coffe text-light pl-5 mb-1 item-list-res" >
                                    <i class="bi bi-people-fill mr-3 " aria-hidden="true"></i>
                                    Usuarios
                                </a>
                                <%
                                    }
                                %>
                                <a href="productos.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-basket2-fill mr-3" aria-hidden="true"></i>
                                    Productos
                                </a>
                                <a href="provedores.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-people-fill mr-3" aria-hidden="true"></i>
                                    Proveedores
                                </a>
                                <a href="areas.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-layers-fill mr-3" aria-hidden="true"></i>
                                    Áreas
                                </a>
                                <a href="unidadMedida.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-thermometer-low mr-3" aria-hidden="true"></i>
                                    Unidades de Medida
                                </a>
                            </div>
                            <a href="#setting-items" data-toggle="collapse" aria-expanded="false"
                               id="acciones">

                            </a>
                            <div id="setting-items-responsive" class="collapse" data-parent="#sidebar-accordion">
                                <div class="bg-coffee text-light text-center">Registro</div>
                                <div class="d-flex flex-row text-center" >
                                    <a href="registrarEntrada.jsp"
                                       class="list-group-item list-group-item-action bg-coffee text-light  mb-1" style="border-radius: 0;">
                                        <i class="bi bi-arrow-left-square-fill mr-3" aria-hidden="true"></i>
                                        Entrada
                                    </a>
                                    <a href="registrarSalidas.jsp"
                                       class="list-group-item list-group-item-action bg-coffee text-light  mb-1" style="border-radius: 0;">
                                        <i class="bi bi-arrow-right-square-fill mr-3"
                                           aria-hidden="true"></i>
                                        Salida
                                    </a>
                                </div>
                            </div>
                            <a href="#profile-items" data-toggle="collapse" aria-expanded="false"
                               class="list-group-item list-group-item-action bg-coffee text-light  mb-2" id="reportess">
                                <i class="bi bi-clipboard2 mr-3" aria-hidden="true"></i>Reportes
                            </a>
                            <div id="profile-items-responsive" class="collapse" data-parent="#sidebar-accordion">
                                <a href="entradas.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-clipboard-data-fill mr-3" aria-hidden="true"></i>
                                    Entrada
                                </a>
                                <a href="salidas.jsp"
                                   class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                    <i class="bi bi-clipboard-check-fill mr-3" aria-hidden="true"></i>
                                    Salida
                                </a>

                            </div>
                        </div>
                    </div>

                </div>
            </a>
            <div class="collapse navbar-collapse" id="navbarsExample07XL">
                <ul class="navbar-nav mr-auto">
                </ul>
                <div class="log">
                    <a href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                </div>

            </div>
        </nav>
        <section class="p-3">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-3 p-0 barraa">
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div id="sidebar" class="h-100">
                            <!--<div class="hbs"><img src="img/hbs.png" width="50px"></div>-->
                            <div id="sidebar-accordion" class="accordion" style="width: 70%;">
                                <div class="list-group" style="margin-top: 10px;">
                                    <a href="#dashboard-items" data-toggle="collapse" aria-expanded="false"
                                       class="list-group-item list-group-item-action text-light mb-2" id="item">
                                        <i class="bi bi-collection-fill mr-3" aria-hidden="true" ></i>Catálogos
                                    </a>
                                    <div id="dashboard-items" class="collapse" data-parent="#sidebar-accordion">
                                        <%
                                            if(session.getAttribute("tipoSesion").equals("admin")){
                                        %>
                                        <a href="home.jsp"
                                           class="list-group-item list-group-item-action bg-coffe text-light pl-5 mb-1">
                                            <i class="bi bi-people-fill mr-3" aria-hidden="true"></i>
                                            Usuarios
                                        </a>
                                        <%
                                            }
                                        %>
                                        <a href="productos.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-basket2-fill mr-3" aria-hidden="true"></i>
                                            Productos
                                        </a>
                                        <a href="provedores.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-people-fill mr-3" aria-hidden="true"></i>
                                            Proveedores
                                        </a>
                                        <a href="areas.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-layers-fill mr-3" aria-hidden="true"></i>
                                            Áreas
                                        </a>
                                        <a href="unidadMedida.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-thermometer-low mr-3" aria-hidden="true"></i>
                                            Unidades de Medida
                                        </a>
                                    </div>
                                    <!--
                                    <a href="#setting-items" data-toggle="collapse" aria-expanded="false"
                                       class="list-group-item list-group-item-action bg-coffee text-light  mb-2">
                                        <i class="fa fa-cog mr-3" aria-hidden="true"></i>Acciones
                                    </a>
                                    -->
                                    <div id="setting-items" class="collapse" data-parent="#sidebar-accordion">
                                        <div class="bg-coffee text-light text-center">Registro</div>
                                        <div class="d-flex flex-row text-center" >
                                            <a href="registrarEntrada.jsp"
                                               class="list-group-item list-group-item-action bg-coffee text-light  mb-1" style="border-radius: 0;">
                                                <i class="bi bi-arrow-left-square-fill mr-3" aria-hidden="true"></i>
                                                Entrada
                                            </a>
                                            <a href="registrarSalidas.jsp"
                                               class="list-group-item list-group-item-action bg-coffee text-light  mb-1" style="border-radius: 0;">
                                                <i class="bi bi-arrow-right-square-fill mr-3"
                                                   aria-hidden="true"></i>
                                                Salida
                                            </a>
                                            <%
                                                if(session.getAttribute("tipoSesion").equals("admin")){
                                            %>
                                            <a href="reporteDelDia.jsp"
                                               class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                                <i class="bi bi-clipboard-check-fill mr-3" aria-hidden="true"></i>
                                                Inventario
                                            </a>
                                            <%
                                                }
                                            %>
                                        </div>
                                    </div>
                                    <a href="#profile-items" data-toggle="collapse" aria-expanded="false"
                                       class="list-group-item list-group-item-action bg-coffee text-light  mb-2" >
                                        <i class="bi bi-clipboard2 mr-3" aria-hidden="true"></i>Reportes
                                    </a>
                                    <div id="profile-items" class="collapse" data-parent="#sidebar-accordion">
                                        <a href="entradas.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-clipboard-data-fill mr-3" aria-hidden="true"></i>
                                            Entrada
                                        </a>
                                        <a href="salidas.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-clipboard-check-fill mr-3" aria-hidden="true"></i>
                                            Salida
                                        </a>
                                        <%
                                            if(session.getAttribute("tipoSesion").equals("admin")){
                                        %>
                                        <a href="reporteDelDia.jsp"
                                           class="list-group-item list-group-item-action bg-coffee text-light pl-5 mb-1">
                                            <i class="bi bi-clipboard-check-fill mr-3" aria-hidden="true"></i>
                                            Inventario
                                        </a>
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-9 contenedorPrc">
                        <div class="d-flex justify-content-between align-items-center " style="margin: 15px;">
                            <div></div> <!-- Espacio para centrar el formulario de búsqueda a la derecha -->
                            <!--
                            <form class="d-flex" role="search">
                                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search" style="width: 200px;">
                                <button class="btn btn-outline-success" type="submit" style="margin-left: 5px;"><i class="bi bi-search"></i>
                                </button>
                            </form>
                            -->
                        </div>

                        <div class="d-flex justify-content-between align-items-center " style="margin: 15px;">
                            <div></div> <!-- Espacio para centrar el formulario de búsqueda a la derecha -->

                            <form class="d-flex" role="search">

                                <input class="form-control me-2" type="text" placeholder="Buscar" aria-label="Search" style="width: 200px;" id="searchInput"  onkeyup="searchName()">

                                <label class="btn btn-outline-success"  style="margin-left: 5px;"><i class="bi bi-search"></i>
                                </label>

                            </form>

                        </div>

                        <div style="position: relative; display: block">
                            <table class="table">
                                <thead>
                                <tr>
                                    <th class="todisable2">Clave producto</th>
                                    <th>Nombre Producto</th>
                                    <th class="todisable">Descripción producto</th>
                                    <th   id="columnaAcciones" colspan="2" style="position: relative;" >Acciones</th>
                                    <th></th>
                                    <th style="text-align: right;">
                                        <i id="agregar-fila" class="bi bi-plus-circle-fill custom-color" style="font-size: 2.5rem;"></i>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    System.out.println("PRODUCTOS");
                                    ProductosDao dao = new ProductosDao();
                                    List<Productos> lista = dao.getAll();
                                    int numeroElementos = lista.size();
                                    double numeroPaginadores = (double) numeroElementos/10;
                                    System.out.println("numero de Elementos: "+numeroElementos);
                                    int numeroPaginadoreDecimal = numeroElementos/10;
                                    if(numeroPaginadoreDecimal == 0){
                                        numeroPaginadoreDecimal = 1;
                                    }
                                    System.out.println("Antes de obtener el parametro de la url");
                                    String paginadorSolicitado = "1";
                                    if(request.getParameter("value") == null){
                                        paginadorSolicitado = "1";
                                    }else{
                                        paginadorSolicitado = request.getParameter("value");
                                    }
                                    int paginadorSolicitadoInt = Integer.parseInt(paginadorSolicitado);

                                    int contador = 0;
                                    System.out.println("Antes de mequetreque para lo de los paginadores");
                                    if(numeroPaginadores >= 0 && numeroPaginadores < 1){
                                        numeroPaginadores = 1;
                                    } else if (numeroPaginadores > numeroPaginadoreDecimal ) {
                                        numeroPaginadoreDecimal++;
                                    }
                                    if(paginadorSolicitadoInt > numeroPaginadoreDecimal){
                                        paginadorSolicitadoInt = numeroPaginadoreDecimal;
                                    }else if (paginadorSolicitadoInt < 1) {
                                        paginadorSolicitadoInt = 1;
                                    }
                                    System.out.println("Antes de imprimir la tabla");
                                    for(Productos u : lista){
                                        if( contador >= ((paginadorSolicitadoInt * 10)-10) && contador < (paginadorSolicitadoInt * 10)){
                                            System.out.println("Con el paginador: "+paginadorSolicitadoInt);
                                            System.out.println(("contador >= "+((paginadorSolicitadoInt * 10)-10) + "&& contador < "+(paginadorSolicitadoInt * 10) ));
                                %>

                                <tr>
                                    <td class="todisable2"><%= u.getClaveProducto() %></td>
                                    <td><%= u.getNombreProducto() %></td>
                                    <td class="todisable"><%= u.getDescripcionProducto() %></td>
                                    <td id="acc" class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#visualizarProductosModal<%= u.getClaveProducto() %>">
                                            <img class="act" src="img/visibility_24dp.png">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#editModal<%= u.getClaveProducto() %>">
                                            <img class="act" src="img/iconolapiz-removebg-preview.png">
                                        </a>
                                    </td>

                                    <td class="acc">
                                        <label class="switch small">
                                            <a href="ActualizarEstadoProducto?id=<%=u.getClaveProducto()%>&estado=<%=u.getEstadoProducto()%>" class="delete-link" style="display: none;">Eliminar</a>
                                            <input type="checkbox" class="inn" data-estado="<%=u.getEstadoProducto()%>" <%= u.getEstadoProducto() == 1 ? "checked" : "" %> onclick="toggleSlider(this)">
                                            <span class="slider"></span>
                                        </label>
                                    </td>
                                </tr>

                                <!-- Modal para Editar Información -->
                                <div class="modal fade" id="editModal<%= u.getClaveProducto() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= u.getClaveProducto() %>" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= u.getClaveProducto() %>">Editar Información del Producto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editForm<%= u.getClaveProducto() %>" action="actualizarProducto.jsp" method="post">
                                                    <input type="hidden" name="claveProducto" value="<%= u.getClaveProducto() %>">
                                                    <div class="form-group">
                                                        <label for="nombreProducto<%= u.getClaveProducto() %>">Nombre Producto:</label>
                                                        <input type="text" class="form-control" id="nombreProducto<%= u.getClaveProducto() %>" name="nombreProducto" value="<%= u.getNombreProducto() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="descripcionProducto<%= u.getClaveProducto() %>">Descripción Producto:</label>
                                                        <input type="text" class="form-control" id="descripcionProducto<%= u.getClaveProducto() %>" name="descripcionProducto" value="<%= u.getDescripcionProducto() %>" required>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer" style="justify-content: center">
                                                <button type="button" class="btn btn-secondary"  data-dismiss="modal" style="background-color: #df1616;">Cancelar</button>
                                                <button type="submit" class="btn btn-primary" form="editForm<%= u.getClaveProducto() %>">Guardar Cambios</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="modal fade" id="visualizarProductosModal<%= u.getClaveProducto() %>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content rounded-3 border-0 shadow-lg" style="background-color: #f6f8fa; max-width: 500px;">
                                            <div class="modal-header border-bottom-0">
                                                <h5 class="modal-title font-weight-bold" style="color: #333;">Información del Producto</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #aaa; font-size: 1.5rem;">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Clave Producto:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getClaveProducto() %></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Nombre Producto:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getNombreProducto() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Descripción Producto:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getDescripcionProducto() %></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Unidad Medida:</label>
                                                            <p class="form-control-static" style="color: #555;"><%=u.getUnidadMedida()%></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer border-top-0" style="justify-content: center">
                                                <button type="button" class="btn btn-secondary"  data-dismiss="modal" style="background-color: #df1616;">Cerrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <%} contador++;%>
                                <% } %>
                                </tbody>
                            </table>
                            <script>
                                function searchName() {
                                    // Obtener el valor del campo de búsqueda
                                    let input = document.getElementById('searchInput').value.toLowerCase();

                                    // Obtener las filas de la tabla
                                    let rows = document.querySelectorAll('#tabla-body tr');

                                    // Iterar sobre las filas y comparar los nombres
                                    rows.forEach(row => {
                                        let nombre = row.querySelector('td:nth-child(2)').textContent.toLowerCase();

                                        // Mostrar u ocultar las filas según si el nombre coincide
                                        if (nombre.includes(input)) {
                                            row.style.display = '';
                                        } else {
                                            row.style.display = 'none';
                                        }
                                    });
                                }
                            </script>
                            <nav aria-label="...">
                                <ul id ="pagination" class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" id="anteriorPaginador" href="productos.jsp?value=<%=paginadorSolicitadoInt-1%>" >Anterior</a>
                                    </li>
                                    <%
                                        System.out.println("Decimal: "+numeroPaginadores);
                                        System.out.println("Entero: "+numeroPaginadoreDecimal);
                                        for(int i =0; i<numeroPaginadoreDecimal; i++){
                                    %>
                                    <%
                                        if((i+1)==paginadorSolicitadoInt){
                                    %>

                                    <li class="page-item active"><a class="page-link" href="productos.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                    } else{
                                    %>
                                    <li class="page-item"><a class="page-link" href="productos.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" id="siguientePaginador" href="productos.jsp?value=<%=paginadorSolicitadoInt+1%>"  >Siguiente</a>
                                    </li>

                                </ul>
                            </nav>

                        </div>
                        <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                            <i class="bi bi-plus-lg"></i>-->
                        <!--<img src="img/add-removebg-preview.png" width="90px" id="agregar-filaP">-->
                        </button>
                    </div>
                </div>


            </div>

        </section>

    </div>
</div>
<!-- Modal(aqui estaba xd) -->
<!--formulario de registro (add)-->
<div class="popup-container" id="popup-container">
    <div class="popup-header text-center">
        <h2>Registro de Productos</h2>
        <div>
            <i class="bi bi-x-circle-fill icon-hover" style="color: #df1616; font-size: 3rem;" id="close-br"></i>
        </div>
    </div>
    <form method="post" action="registroProducto">
        <div class="container mt-3">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="rfc">Clave</label>
                        <input type="text" class="form-control" id="rfc" name="clave" required>
                    </div>

                    <div class="form-group mt-6">
                        <label for="nombre2A">Descripción:</label>
                        <input style="width: 100%;"  type="text" class="form-control" id="nombre2A" name="descipcion" placeholder="Opcional" >
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group mt-0">
                        <label for="nombre1">Nombre Producto:</label>
                        <input type="text" class="form-control" id="nombre1" name="nombre" required>
                    </div>
                    <div class="form-group mt-0">
                        <label for="unidadMedida">Unidad de Medida:</label>
                        <select id="unidadMedida" name="unidadMedida" oninput="updateTable(contadorFilas,folio_EG)">
                            <%
                                if (unidadMedida != null) {
                                    for (UnidadMedida unidadM : unidadMedida) {
                            %>
                            <option value="<%= unidadM.getAbreviacionUndidadMedida() %>"><%= unidadM.getNombreUnidadMedida()%></option>
                            <%
                                }
                            } else {
                            %>
                            <option value="">No hay unidades de medida disponibles</option>
                            <%
                                }
                            %>

                        </select>
                    </div>
                </div>
            </div>
        </div>
        <div class="text-center mt-3" >
            <button id="btn-enviarr" type="submit" class="btn btn-primary">Agregar</button>
            <button  style="background-color:#df1616;   background-color: #df1616;  border-color: #df1616;color: white; width: 90px; outline: none;" id="btn-cancelar" type="button" class="btn btn-primary" onclick="cancelForm()">Cancelar</button>
        </div>
    </form>
</div>
<script>


    const elemento = document.getElementById("item-responsive");
    const desboardItems = document.getElementById("dashboard-items-responsive");
    const accioness = document.getElementById("setting-items-responsive");
    const acciones = document.getElementById("acciones");
    const reportes = document.getElementById("reportess");
    const reportess = document.getElementById("profile-items-responsive");
    const hamburguesa = document.getElementById("hbsb");
    const menu = document.getElementById("sidebar-accordion-responsive");
    elemento.addEventListener("click", function () {
        if(elemento.getAttribute("aria-expanded") === "true"){
            elemento.removeAttribute("aria-expanded","false");
            elemento.setAttribute("class","list-group-item list-group-item-action text-light mb-2");
            desboardItems.removeAttribute("class","collapse");
            desboardItems.setAttribute("class","collapse show")
        }else{
            elemento.removeAttribute("aria-expanded","true");
            elemento.setAttribute("class","list-group-item list-group-item-action text-light mb-2 collapsed");
            desboardItems.removeAttribute("class","collapse show");
            desboardItems.setAttribute("class","collapse")
        }

    })
    acciones.addEventListener("click", function (){
        if(accioness.getAttribute("class") === "collapse"){
            accioness.removeAttribute("class","collapse");
            accioness.setAttribute("class","collapse show")
        }else{
            accioness.removeAttribute("class","collapse show");
            accioness.setAttribute("class","collapse")
        }
    })
    reportes.addEventListener("click", function (){
        if(reportess.getAttribute("class") === "collapse"){
            reportess.removeAttribute("class","collapse");
            reportess.setAttribute("class","collapse show")
        }else{
            reportess.removeAttribute("class","collapse show");
            reportess.setAttribute("class","collapse")
        }
    })
    hamburguesa.addEventListener("click", function (event){
        event.preventDefault();
        if(menu.style.display === "none"){
            menu.style.display = "block";
        }else{
            menu.style.display = "none"
        }

    })
    document.getElementById("agregar-fila").addEventListener("click",function (){ /*add*/
        // alert("si se da clic");
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        let paginador = document.getElementById("pagination");
        if(pop.style.display === "none"){
            pop.style.display = "block";
            capa.style.zIndex = 1;
            pop.style.zIndex = 2;
            capa.style.backgroundColor = "rgba(0,0,0,0.7)";
            paginador.style.position = "absolute";
            paginador.style.zIndex = -5;
            window.addEventListener('scroll', noScroll);
        }else{
            pop.style.display = "none";
            todoLoQueEstorba.style.zIndex = 0;
            paginador.style.position = "absolute";
            paginador.style.zIndex = 3;
        }
    })
    document.getElementById("close-br").addEventListener("click", function () {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        if (pop.style.display === "none") {
            pop.style.display = "block";
        } else {
            capa.style.zIndex = -1;
            capa.style.backgroundColor = "rgba(255,255,255,0)";
            pop.style.display = "none";
            window.removeEventListener('scroll', noScroll);
        }
    });

    document.getElementById("close").addEventListener("click",function (){
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        //pop.style.display = "none";

        if(pop.style.display === "none"){
            pop.style.display = "block";
        }else{
            capa.style.zIndex = -1;
            capa.style.backgroundColor = "rgba(255,255,255,0)";
            pop.style.display = "none";
            window.removeEventListener('scroll', noScroll);
        }

    })

    function noScroll() {
        window.scrollTo(0, 0);
    }
    function cancelForm() {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        if (pop.style.display === "block") {
            capa.style.zIndex = -1;
            capa.style.backgroundColor = "rgba(255,255,255,0)";
            pop.style.display = "none";
            window.removeEventListener('scroll', noScroll);
        }
    }
    function showPopup() {
        document.getElementById("popup-container").style.display = "block";
        document.getElementById("capa-obscurecer").style.display = "block";
        document.getElementById("capa-obscurecer").style.zIndex = 1050;
        document.getElementById("capa-obscurecer").style.backgroundColor = "rgba(0, 0, 0, 0.5)";
        window.addEventListener('scroll', noScroll);
    }
    document.getElementById("close-br").addEventListener("click", cancelForm);
    document.getElementById("btn-cancelar").addEventListener("click", cancelForm);

</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>

</html>