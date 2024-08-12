<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saditarea.modelo.UnidadMedida" %>
<%@ page import="mx.edu.utez.saditarea.dao.UnidadMedidaDao" %>
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
    <link rel="icon" href="img/apple-touch-icon.png" type="image/png">

</head>
<style>
    .custom-color {
        color: #28a745;
    }
    .add-button {
        right: 10px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 3.3rem;
        border: none;
    }
    .add-button:hover {
        background-color: #e6f9ea; /* Color verde brillante al pasar el cursor */
        box-shadow: 0 0 10px 5px #e6f9ea; /* Sombra verde brillante al pasar el cursor */
    }
    .contenedorInputs {
        display: flex;
        justify-content: center;
        align-items: center;
        margin-top: 20px; /* Ajusta el margen superior si es necesario */
    }

    .contenedorInputs .form-group {
        margin: 10px; /* Espacio entre los campos */
    }

    .form-control {
        text-align: center; /* Centra el texto dentro de los inputs */
    }
    .icon-hover {

        transition: color 0.3s, transform 0.3s;
    }
    .icon-hover:hover {
        transform: scale(1.2); /* Aumenta el tamaño del icono al pasar el cursor */
    }
</style>

<script>

    let apagados = 0;
    clikis = 0  ;
    function checar(input){

        //console.log("cuando se inteta cambiar de esstad el estatus es: "+estado);
        clikis ++;
        console.log(clikis);
        if(clikis>(document.querySelectorAll(".inn").length)-apagados){
            let toStatusActive = document.getElementById("activar");
            let toStatusInactive = document.getElementById("desactivar");
            let mensaje = document.getElementById("contbasemsj");
            let aceptar = document.getElementById("aceptar");
            let cancelar = document.getElementById("cancelar");
            let aceptarO = document.getElementById("aceptarO");
            let cancelarO = document.getElementById("cancelarO");
            let estado = input.getAttribute("data-estado");
            if(estado == 1){
                mensaje.style.display = "block";
                toStatusInactive.style.display = "block"
                aceptar.addEventListener("click",event =>{
                    input.previousElementSibling.click();
                    mensaje.style.display = "none";
                })
                cancelar.addEventListener("click",event =>{
                    mensaje.style.display = "none";
                    location.reload();
                })
            }else{
                mensaje.style.display = "block";
                toStatusActive.style.display = "block"
                aceptarO.addEventListener("click",event =>{
                    input.previousElementSibling.click();
                    mensaje.style.display = "none";
                })
                cancelarO.addEventListener("click",event =>{
                    mensaje.style.display = "none";
                    location.reload();
                })
            }

        }
    }
    /*  function triggerDelete(input) {
          console.log(clikis);
          if(clikis >= 2){
              input.previousElementSibling.click();
          }
          clikis ++;
      }*/
</script>
<body>
<div id="contbasemsj">
    <div class="basemsj" id="basemsj">
        <div class="confirmar-cambio-estado-of" id="desactivar">
            <h2>¿DESACTIVAR PRODUCTO? </h2>
            <h5>(No aparecerá en las entradas ni salidas)</h5>
            <h3>¿Desea continuar?</h3>
            <div class="btn-ar">
                <button id="aceptar">
                    Aceptar
                </button>
                <button id="cancelar">
                    Cancelar
                </button>
            </div>
        </div>
        <div class="confirmar-cambio-estado-of" id="activar">
            <h2>¿ACTIVAR PRODUCTO? </h2>
            <h5>(Aparecerá en las entradas ni salidas)</h5>
            <h3>¿Desea continuar?</h3>
            <div class="btn-ar">
                <button id="aceptarO">
                    Aceptar
                </button>
                <button id="cancelarO">
                    Cancelar
                </button>
            </div>
        </div>
    </div>
</div>
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
                    <h1>UNIDAD DE MEDIDA</h1>
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

                        <div style="position: relative; display: block">


                            <table class="table table-hover tab">
                                <thead>
                                <tr>
                                    <th class="todisable2">Abreviación</th>
                                    <th>Nombre</th>
                                    <th class="todisable">Acciones</th>
                                    <th   id="columnaAcciones" colspan="2" style="position: relative;" ></th>
                                    <th></th>
                                    <th style="text-align: right;">
                                        <i id="agregar-fila" class="bi bi-plus-circle-fill custom-color" style="font-size: 2.5rem;"></i>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    UnidadMedidaDao dao = new UnidadMedidaDao();
                                    List<UnidadMedida> lista = dao.getAll();
                                    int numeroElementos = lista.size();
                                    double numeroPaginadores = (double) numeroElementos / 10;
                                    int numeroPaginadoreDecimal = numeroElementos / 10;
                                    if (numeroPaginadoreDecimal == 0) {
                                        numeroPaginadoreDecimal = 1;
                                    }

                                    String paginadorSolicitado = request.getParameter("value") == null ? "1" : request.getParameter("value");
                                    int paginadorSolicitadoInt = Integer.parseInt(paginadorSolicitado);

                                    int contador = 0;
                                    if (numeroPaginadores >= 0 && numeroPaginadores < 1) {
                                        numeroPaginadores = 1;
                                    } else if (numeroPaginadores > numeroPaginadoreDecimal) {
                                        numeroPaginadoreDecimal++;
                                    }

                                    if (paginadorSolicitadoInt > numeroPaginadoreDecimal) {
                                        paginadorSolicitadoInt = numeroPaginadoreDecimal;
                                    } else if (paginadorSolicitadoInt < 1) {
                                        paginadorSolicitadoInt = 1;
                                    }

                                    for (UnidadMedida u : lista) {
                                        if (contador >= ((paginadorSolicitadoInt * 10) - 10) && contador < (paginadorSolicitadoInt * 10)) {
                                %>

                                <tr>
                                    <td><%= u.getAbreviacionUndidadMedida() %></td>
                                    <td><%= u.getNombreUnidadMedida() %></td>
                                    <td>
                                        <a href="visualizarUnidad.jsp" class="acc">
                                            <img class="act" src="img/visibility_24dp.png" alt="Ver">
                                        </a>
                                    </td>
                                    <td>
                                        <a href="#" class="acc" data-toggle="modal" data-target="#editModal<%= u.getAbreviacionUndidadMedida() %>">
                                            <img class="act" src="img/iconolapiz-removebg-preview.png" alt="Editar">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <label class="switch small">
                                            <a href="actualizarEstadoUM?id=<%= u.getAbreviacionUndidadMedida() %>&estado=<%= u.getEstadoUm() %>" class="delete-link" style="display: none;">Eliminar</a>
                                            <input type="checkbox" class="inn" data-estado="<%= u.getEstadoUm() %>" onclick="checar(this);">
                                            <span class="slider"></span>
                                            <%
                                                if (u.getEstadoUm() == 1) {
                                            %>
                                            <script>
                                                document.querySelectorAll(".inn")[((document.querySelectorAll(".inn").length) - 1)].click();
                                            </script>
                                            <%
                                            } else {
                                            %>
                                            <script>
                                                apagados++;
                                            </script>
                                            <%
                                                }
                                            %>
                                        </label>
                                    </td>
                                </tr>

                                <!-- Modal para Editar Información -->
                                <div class="modal fade" id="editModal<%= u.getAbreviacionUndidadMedida() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= u.getAbreviacionUndidadMedida() %>" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= u.getAbreviacionUndidadMedida() %>">Editar Unidad de Medida</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editForm<%= u.getAbreviacionUndidadMedida() %>" action="ActualizarUnidadMedida" method="post">
                                                    <input type="hidden" name="claveFija" value="<%= u.getAbreviacionUndidadMedida() %>">
                                                    <div class="form-group">
                                                        <label for="abrum<%= u.getAbreviacionUndidadMedida() %>">Abreviación Unidad de Medida:</label>
                                                        <input type="text" class="form-control" id="abrum<%= u.getAbreviacionUndidadMedida() %>" name="abrum" value="<%= u.getAbreviacionUndidadMedida() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombreUnidadMedida<%= u.getAbreviacionUndidadMedida() %>">Nombre Unidad de Medida:</label>
                                                        <input type="text" class="form-control" id="nombreUnidadMedida<%= u.getAbreviacionUndidadMedida() %>" name="nombreUnidadMedida" value="<%= u.getNombreUnidadMedida() %>" required>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary" form="editForm<%= u.getAbreviacionUndidadMedida() %>">Guardar Cambios</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%
                                        }
                                        contador++;
                                    }
                                %>
                                </tbody>
                            </table>

                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" id="anteriorPaginador" href="unidadMedida.jsp?value=<%=paginadorSolicitadoInt-1%>" >Anterior</a>
                                    </li>
                                    <%
                                        System.out.println("Decimal: "+numeroPaginadores);
                                        System.out.println("Entero: "+numeroPaginadoreDecimal);
                                        for(int i =0; i<numeroPaginadoreDecimal; i++){
                                    %>
                                    <%
                                        if((i+1)==paginadorSolicitadoInt){
                                    %>

                                    <li class="page-item active"><a class="page-link" href="unidadMedida.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                    } else{
                                    %>
                                    <li class="page-item"><a class="page-link" href="unidadMedida.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" id="siguientePaginador" href="unidadMedida.jsp?value=<%=paginadorSolicitadoInt+1%>"  >Siguiente</a>
                                    </li>

                                </ul>
                            </nav>
                            <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                                <i class="bi bi-plus-lg"></i>-->
                            <!--<img src="img/add-removebg-preview.png" width="90px" id="agregar-filaU">-->
                            </button>
                        </div>
                    </div>


                </div>
            </div>
        </section>

    </div>
</div>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Confirmación de Desactivación</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ¿Está seguro de que desea desactivar este usuario?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                <button type="button" class="btn btn-primary">Confirmar</button>
            </div>
        </div>
    </div>
</div>
<!--formulario de registro (add)-->
<div class="popup-container" id="popup-container">
    <div class="popup-header text-center" style="display: flex; justify-content: space-between; align-items: center; width: 100%;">
    <div style="flex: 1; display: flex; justify-content: center;">
        <h2 style="text-align:center; margin: 0;" >Registro de Unidad de Medida</h2>
    </div>
        <i class="bi bi-x-circle-fill icon-hover
" style="color: #df1616; font-size: 3rem;" id="close-br"></i>
    </div>
    <form action="RegistrarUnidadMedida" method="post">
        <div class="contenedorInputs">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="nombre1A">Abreviatura:</label>
                        <input type="text" id="nombre1A" name="abrev" class="form-control" required>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="direccion">Nombre:</label>
                        <input type="text" id="direccion" name="nombre" class="form-control" required>
                    </div>
                </div>
            </div>
        </div>
        <p></p>
        <p></p>
        <div class="text-center">
            <button id="btn-enviarr" type="submit" class="btn btn-primary mx-2">Agregar</button>
            <button id="btn-cancelar" type="button" class="btn" style="background-color:#df1616; border-color: #df1616; color: white; width: 90px;" onclick="cancelForm()">Cancelar</button>
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
        if(pop.style.display === "none"){
            pop.style.display = "block";
            capa.style.zIndex = 1;
            pop.style.zIndex = 2;
            capa.style.backgroundColor = "rgba(0,0,0,0.7)";
            window.addEventListener('scroll', noScroll);
        }else{
            pop.style.display = "none";
            todoLoQueEstorba.style.zIndex = 0;
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
</body>

</html>



