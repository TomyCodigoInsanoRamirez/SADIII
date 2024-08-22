<%@page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saditarea.dao.AreasDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Areas" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <style>
        .custom-color {
            color: #28a745;
        }
        .derecha {
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: initial
        }

        .izquierda {
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: initial

        }
        .izquierda2 {
            width: 50%;
            display: flex;
            flex-direction: column;
            align-items: initial;
        }
    </style>

</head>

<%
    String message = (String) session.getAttribute("message");
    if ("success".equals(message)) {
%>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        Swal.fire({
            icon: 'success',
            title: 'Éxito',
            text: 'El usuario se ha registrado correctamente.',
            confirmButtonText: 'Aceptar'
        });
    });
</script>
<%
    session.removeAttribute("message");
} else if ("error_usuario_existente".equals(message)) {
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
        session.removeAttribute("message");
    }
%>
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
        const action = isChecked ? 'activado' : 'desactivado';
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
</script>
<body>
<!--Modal que se muesta al slider -->



<script>
    function toggleSlider(element) {
        clikis++;
        console.log("Si se hace click en el de activar o no")
        const isChecked = element.checked;
        const action = isChecked ? 'activar' : 'desactivar';
        const title = isChecked ? '¿Estás seguro de activar el usuario?' : '¿Estás seguro de desactivar el usuario?';
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
            allowOutsideClick: false, // Evita cerrar la alerta al hacer clic fuera de ella
            allowEscapeKey: false, // Evita cerrar la alerta con la tecla Escape
            allowEnterKey: false
        }).then((result) => {
            if (result.isConfirmed) {
                element.previousElementSibling.click();
                const actionText = isChecked ? 'activado' : 'desactivado'; // Crear el texto en base al estado del checkbox
                //if(clikis>(document.querySelectorAll(".inn").length)-apagados){element.previousElementSibling.click();}
                // Aquí puedes realizar la acción adicional como enviar una solicitud al servidor

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

    document.addEventListener('DOMContentLoaded', (event) => {
        // Simular el estado inicial del slider
        document.querySelectorAll('.inn').forEach(input => {
            if (input.dataset.estado == 1) {
                input.checked = true;
                document.querySelector('.slider').classList.add('active');
            }
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
                title: action === "activado" ? "Desactivado!" : "Activado!",
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
<div class="d-flex " >
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <a id="logoImg" href=""><img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px" ></a>
                <a id="loginImg" href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                <div class="hbs"><a href="" id="hbsb"><img src="img/hbs.png" width="50px"></a></div>
                <div class="tituloSeccion">
                    <h1>ÁREAS</h1>
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
                                                Invrentario
                                            </a>
                                            <%
                                                }else{
                                                    System.out.println("No se pinta patrón");
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
                                            }else{
                                                System.out.println("No se pinta patrón");
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
                            <table class="table table-hover tab">
                                <thead>
                                <tr>
                                    <th class="todisable2">Clave área</th>
                                    <th>Nombre área</th>
                                    <th class="todisable">Descripción área</th>
                                    <th id="columnaAcciones">Acciones </th>
                                    <th></th>
                                    <th style="text-align: right; ">
                                        <i id="agregar-fila" class="bi bi-plus-circle-fill custom-color" style="font-size: 2.5rem;"></i>
                                    </th>
                                    <!--<th>
                                    <img src="img/add-removebg-preview.png" width="90px" id="agregar-filaA"></th>-->
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    AreasDao dao = new AreasDao();
                                    List<Areas> lista = dao.getAll();
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
                                    } else if (paginadorSolicitadoInt < 1) {
                                        paginadorSolicitadoInt = 1;
                                    }
                                    System.out.println("Antes de imprimir la tabla");
                                    for(Areas u : lista){
                                        if( contador >= ((paginadorSolicitadoInt * 10)-10) && contador < (paginadorSolicitadoInt * 10)){
                                            System.out.println("Con el paginador: "+paginadorSolicitadoInt);
                                            System.out.println(("contador >= "+((paginadorSolicitadoInt * 10)-10) + "&& contador < "+(paginadorSolicitadoInt * 10) ));
                                %>
                                <tr>
                                    <td class="todisable2"><%= u.getClaveArea() %></td>
                                    <td><%= u.getNombreArea() %></td>
                                    <td class="todisable"><%= u.getDescripcionArea() %></td>
                                    <td id="acc" class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#viewModal<%= u.getClaveArea() %>">
                                            <img class="act" src="img/visibility_24dp.png" width="70px">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#editModal<%= u.getClaveArea() %>">
                                            <img class="act" src="img/iconolapiz-removebg-preview.png" alt="Editar" >
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <label class="switch small">
                                            <a href="actualizarAreaE?id=<%=u.getClaveArea()%>&estado=<%=u.getEstadoAr()%>" class="delete-link" style="display: none;">Eliminar</a>
                                            <input type="checkbox" class="inn" data-estado="<%=u.getEstadoAr()%>" onclick="toggleSlider(this);">
                                            <span class="slider" ></span>
                                            <%
                                                if(u.getEstadoAr() == 1){
                                            %>
                                            <script>
                                                console.log("Aun entra a la condición para activar el slider");
                                                document.querySelectorAll(".inn")[((document.querySelectorAll(".inn").length)-1)].click();
                                            </script>
                                            <%
                                            }else{
                                            %>
                                            <script>
                                                apagados ++;
                                            </script>
                                            <%
                                                }
                                            %>
                                        </label>
                                    </td>
                                </tr>

                                <div class="modal fade" id="viewModal<%= u.getClaveArea() %>" tabindex="-1" role="dialog" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered" role="document">
                                        <div class="modal-content rounded-3 border-0 shadow-lg" style="background-color: #f6f8fa; max-width: 500px;">
                                            <div class="modal-header border-bottom-0">
                                                <h5 class="modal-title font-weight-bold" style="color: #333;">Información del Área</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="color: #aaa; font-size: 1.5rem;">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Clave Área:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getClaveArea() %></p>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Nombre Área:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getNombreArea() %></p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="font-weight-bold" style="color: #333;">Descripción Área:</label>
                                                            <p class="form-control-static" style="color: #555;"><%= u.getDescripcionArea() %></p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer border-top-0" style="justify-content: center">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal" style="background-color: #df1616;">Cerrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Modal para Editar Información -->
                                <div class="modal fade" id="editModal<%= u.getClaveArea() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= u.getClaveArea() %>" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= u.getClaveArea() %>">Editar Información del Área</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editForm<%= u.getClaveArea() %>" action="actualizarArea.jsp" method="post">
                                                    <input type="hidden" name="claveArea" value="<%= u.getClaveArea() %>">
                                                    <div class="form-group">
                                                        <label for="nombreArea<%= u.getClaveArea() %>">Nombre del Área:</label>
                                                        <input type="text" class="form-control" id="nombreArea<%= u.getClaveArea() %>" name="nombreArea" value="<%= u.getNombreArea() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="descripcionArea<%= u.getClaveArea() %>">Descripción del Área:</label>
                                                        <input type="text" class="form-control" id="descripcionArea<%= u.getClaveArea() %>" name="descripcionArea" value="<%= u.getDescripcionArea() %>" required>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer" style="justify-content: center">
                                                <button type="button" class="btn btn-secondary"  data-dismiss="modal" style="background-color: #df1616;">Cancelar</button>
                                                <button type="submit" class="btn btn-primary" form="editForm<%= u.getClaveArea() %>">Guardar Cambios</button>
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
                                    <li  class="page-item ">
                                        <a class="page-link" id="anteriorPaginador" href="areas.jsp?value=<%=paginadorSolicitadoInt-1%>" >Anterior</a>
                                    </li>
                                    <%
                                        System.out.println("Decimal: "+numeroPaginadores);
                                        System.out.println("Entero: "+numeroPaginadoreDecimal);
                                        for(int i =0; i<numeroPaginadoreDecimal; i++){
                                    %>
                                    <%
                                        if((i+1)==paginadorSolicitadoInt){
                                    %>

                                    <li class="page-item active"><a class="page-link" href="areas.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                    } else{
                                    %>
                                    <li class="page-item"><a class="page-link" href="areas.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" id="siguientePaginador" href="areas.jsp?value=<%=paginadorSolicitadoInt+1%>"  >Siguiente</a>
                                    </li>

                                </ul>
                            </nav>
                            <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                                <i class="bi bi-plus-lg"></i>-->
                            <!--<img src="img/add-removebg-preview.png" width="90px" id="agregar-filaA">-->
                            </button>
                        </div>
                    </div>


                </div>
            </div>
        </section>

    </div>
</div>
<!-- Modal -->
<!-- Formulario de registro (add) -->
<div class="popup-container" id="popup-container">
    <div class="popup-header" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
        <div style="flex: 1; display: flex; justify-content: center;">
            <h2 style="margin: 0; text-align: center;">Registro de Áreas</h2>
        </div>
        <i class="bi bi-x-circle-fill icon-hover" id="close-br" style="color: #df1616; font-size: 3rem;"></i>
    </div>

    <form action="AreaServlet" method="post">
        <input type="hidden" name="action" value="agregar">
        <div class="contenedorInputs" style="display: flex;">
            <div class="izquierda" style="flex: 1;">
                <div class="form-group">
                    <label for="claveArea">Clave del Área:</label>
                    <input type="text" class="form-control" id="claveArea" name="claveArea" required  title="Solo se permiten letras y espacios">
                </div>
                <div class="form-group">
                    <label for="nombreArea">Nombre del Área:</label>
                    <input type="text" class="form-control" id="nombreArea" name="nombreArea" required pattern="[A-Za-zÀ-ÿ\s]+" title="Solo se permiten letras y espacios">
                </div>
                <div class="form-group">
                    <label for="descripcionArea">Descripción:</label>
                    <textarea class="form-group"  id="descripcionArea" name="descripcionArea" rows="10" cols="50" placeholder="Descripción">
                 </textarea>
                </div>

            </div>

        </div>
        <div class="form-buttons" style="display: flex; justify-content: center; margin-top: 20px; gap: 10px;">
            <button id="btn-enviar" type="submit" class="btn btn-primary add-btn" style="width: 150px; outline: none;">Agregar</button>
            <button type="button" class="btn btn-primary add-btn" onclick="cancelForm()" style="background-color: #df1616; border-color: #df1616; color: white; width: 150px; outline: none;">Cancelar</button>
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
    document.getElementById("close-br").addEventListener("click", function () {
        let pop = document.getElementById("popup-container");
        pop.style.display = "none";
        document.body.style.overflow = "auto"; // Restaura el scroll de la página principal
        let capaa = document.getElementById("capa-obscurecer");
        capaa.style.display = "none";
    });

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
    document.getElementById("agregar-fila").addEventListener("click", function () {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        pop.style.display = "block";
        capa.style.display = "block";
        document.body.style.overflow = "hidden"; // Evita el scroll de la página principal
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
        document.getElementById('popup-container').style.display = 'none';
    }
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