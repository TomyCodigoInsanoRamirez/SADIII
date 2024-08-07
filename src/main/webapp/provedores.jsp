<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="mx.edu.utez.saditarea.dao.ProveedoresDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Proveedores" %>
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

</head>
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
            <h2>¿DESACTIVAR PROVEEDOR? </h2>
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
            <h2>¿ACTIVAR PROVEEDOR? </h2>
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
                    <h1>PROVEEDORES</h1>
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
                                    <th class="todisable2">RFC</th>
                                    <th>Nombre proveedor</th>
                                    <th class="todisable">Teléfono</th>
                                    <th>Acciones <img src="img/add-removebg-preview.png" width="90px" id="agregar-fila-prov"></th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    ProveedoresDao dao = new ProveedoresDao();
                                    List<Proveedores> lista = dao.findAll();
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
                                    for(Proveedores u : lista){
                                        if( contador >= ((paginadorSolicitadoInt * 10)-10) && contador < (paginadorSolicitadoInt * 10)){
                                            System.out.println("Con el paginador: "+paginadorSolicitadoInt);
                                            System.out.println(("contador >= "+((paginadorSolicitadoInt * 10)-10) + "&& contador < "+(paginadorSolicitadoInt * 10) ));
                                %>

                                <tr>
                                    <td class="todisable2"><%= u.getRFC() %></td>
                                    <td><%= u.getNombre1_P() %></td>
                                    <td class="todisable"><%= u.getTelefono_P() %></td>
                                    <td id="acc" class="acc">
                                        <a href="visualizar.jsp" class="acc">
                                            <img class="act" src="img/visibility_24dp.png">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#editModal<%= u.getRFC() %>">
                                            <img class="act" src="img/iconolapiz-removebg-preview.png">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <label class="switch small">
                                            <a href="actualizarProveedorE?id=<%=u.getRFC()%>&estado=<%=u.getEstado_usu()%>" class="delete-link" style="display: none;">Eliminar</a>
                                            <input type="checkbox" class="inn"  data-estado="<%=u.getEstado_usu()%>" onclick="checar(this);">
                                            <span class="slider"></span>
                                            <%
                                                if(u.getEstado_usu() == 1){
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

                                <!-- Modal para Editar Información -->
                                <div class="modal fade" id="editModal<%= u.getRFC() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= u.getRFC() %>" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= u.getRFC() %>">Editar Información del Proveedor</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editForm<%= u.getRFC() %>" action="actualizarProveedor.jsp" method="post">
                                                    <!--<input type="hidden" name="RFC" value="<%= u.getRFC() %>">-->
                                                    <div class="form-group">
                                                        <label for="rfc<%= u.getRFC() %>">RFC:</label>
                                                        <input type="text" class="form-control" id="rfc<%= u.getRFC() %>" name="RFC" value="<%= u.getRFC() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombreProveedor1<%= u.getRFC() %>">Razón social:</label>
                                                        <input type="text" class="form-control" id="nombreProveedor<%= u.getRFC() %>" name="razonSocial" value="<%= u.getRazon_social() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombreProveedor1<%= u.getRFC() %>">Primer Nombre Proveedor:</label>
                                                        <input type="text" class="form-control" id="nombreProveedor1<%= u.getRFC() %>" name="nombreProveedor1" value="<%= u.getNombre1_P() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombreProveedor2<%= u.getRFC() %>">Segundo Nombre Proveedor:</label>
                                                        <input type="text" class="form-control" id="nombreProveedor2<%= u.getRFC() %>" name="nombreProveedor2" value="<%= u.getNombre2_P() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="apellido1<%= u.getRFC() %>">Primer Apellido Proveedor:</label>
                                                        <input type="text" class="form-control" id="apellido1<%= u.getRFC() %>" name="apellido1" value="<%= u.getApellido1_P() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="apellido2<%= u.getRFC() %>">Segundo Apellido Proveedor:</label>
                                                        <input type="text" class="form-control" id="apellido2<%= u.getRFC() %>" name="apellido2" value="<%= u.getApellido2_P() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="telefonoProveedor<%= u.getRFC() %>">Teléfono Proveedor:</label>
                                                        <input type="text" class="form-control" id="telefonoProveedor<%= u.getRFC() %>" name="telefonoProveedor" value="<%= u.getTelefono_P() %>" >
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="nombreA1<%= u.getRFC() %>">Primer Nombre (Contacto Adicional):</label>
                                                        <input type="text" class="form-control" id="nombreA1<%= u.getRFC() %>" name="nombreA1" value="<%= u.getNombre1_Adicional() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="nombreA2<%= u.getRFC() %>">Segundo Nombre (Contacto Adicional):</label>
                                                        <input type="text" class="form-control" id="nombreA2<%= u.getRFC() %>" name="nombreA2" value="<%= u.getNombre2_Adicional() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="apellido1<%= u.getRFC() %>">Primer Apellido (Contacto Adicional):</label>
                                                        <input type="text" class="form-control" id="apellido1<%= u.getRFC() %>" name="apellidoA1" value="<%= u.getApellido1_Adicional() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="apellido2<%= u.getRFC() %>">Segundo Apellido (Contacto Adicional):</label>
                                                        <input type="text" class="form-control" id="apellido2<%= u.getRFC() %>" name="apellidoA2" value="<%= u.getApellido2_Adicional() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="dirección<%= u.getRFC() %>">Dirección:</label>
                                                        <input type="text" class="form-control" id="dirección<%= u.getRFC() %>" name="direccion" value="<%= u.getDireccion() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="cp<%= u.getRFC() %>">Codigo Postal:</label>
                                                        <input type="text" class="form-control" id="cp<%= u.getRFC() %>" name="cp" value="<%= u.getCodigo_postal() %>" >
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="telefonoA<%= u.getRFC() %>">Teléfono (Contacto adicional):</label>
                                                        <input type="text" class="form-control" id="telefonoA<%= u.getRFC() %>" name="telefonoA" value="<%= u.getTelefono_Adicional() %>" >
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary" form="editForm<%= u.getRFC() %>">Guardar Cambios</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <%} contador++;%>
                                <% } %>
                                </tbody>
                            </table>
                            <nav aria-label="...">
                                <ul class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" id="anteriorPaginador" href="provedores.jsp?value=<%=paginadorSolicitadoInt-1%>" >Anterior</a>
                                    </li>
                                    <%
                                        System.out.println("Decimal: "+numeroPaginadores);
                                        System.out.println("Entero: "+numeroPaginadoreDecimal);
                                        for(int i =0; i<numeroPaginadoreDecimal; i++){
                                    %>
                                    <%
                                        if((i+1)==paginadorSolicitadoInt){
                                    %>

                                    <li class="page-item active"><a class="page-link" href="provedores.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                    } else{
                                    %>
                                    <li class="page-item"><a class="page-link" href="provedores.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" id="siguientePaginador" href="provedores.jsp?value=<%=paginadorSolicitadoInt+1%>"  >Siguiente</a>
                                    </li>

                                </ul>
                            </nav>
                            <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                                <i class="bi bi-plus-lg"></i>-->
                            <!--<img src="img/add-removebg-preview.png" width="90px" id="agregar-fila-prov">-->
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
    <div class="popup-header">
        <h2>Registro de Proveedores</h2>
        <button  class="close-btn" id="close">✖</button>
    </div>
    <form action="RegistrarProveedor" method="post">
        <!-- <button id="close" class="close-btn" >✖</button> -->
        <div class="contenedorInputs">
            <div class="izquierda">
                <div class="form-group">
                    <label for="rfc">RFC:</label>
                    <input type="text" id="rfc" name="rfc">
                </div>
                <div class="form-group">
                    <label for="nombre1">Nombre :</label>
                    <input type="text" id="nombre1" name="nombre1">
                </div>
                <div class="form-group">
                    <label for="nombre2">Segundo nombre :</label>
                    <input type="text" id="nombre2" name="nombre2" placeholder="Opcional">
                </div>
                <div class="form-group">
                    <label for="apellido1">Apellido Paterno :</label>
                    <input type="text" id="apellido1" name="apellido1">
                </div>
                <div class="form-group">
                    <label for="apellido2">Apellido Materno :</label>
                    <input type="text" id="apellido2" name="apellido2">
                </div>
                <div class="form-group">
                    <label for="telefono">Número de telefono :</label>
                    <input type="number" id="telefono" name="telefono">
                </div>

                <div class="form-group">
                    <label for="nombre1A">Nombre (Contacto Adicional) :</label>
                    <input type="text" id="nombre1A" name="nombre1A">
                </div>
            </div>
            <div class="derecha">
                <!--<button id="close" class="close-btn" >✖</button>-->
                <div class="form-group">
                    <label for="nombre2A">Segundo nombre (Contacto Adicional):</label>
                    <input type="text" id="nombre2A" name="nombre2A" placeholder="Opcional">
                </div>
                <div class="form-group">
                    <label for="apellido1A">Apellido Paterno (Contacto Adicional):</label>
                    <input type="text" id="apellido1A" name="apellido1A">
                </div>
                <div class="form-group">
                    <label for="apellido2A">Apellido Materno (Contacto Adicional):</label>
                    <input type="text" id="apellido2A" name="apellido2A">
                </div>
                <div class="form-group">
                    <label for="telefonoA">Número de telefono :</label>
                    <input type="number" id="telefonoA" name="telefonoA">
                </div>
                <div class="form-group">
                    <label for="razonSocial">Razón Social :</label>
                    <input type="text" id="razonSocial" name="razonSocial">
                </div>
                <div class="form-group">
                    <label for="cp">Código postal :</label>
                    <input type="number" id="cp" name="cp">
                </div>

                <div class="form-group">
                    <label for="direccion">Dirección :</label>
                    <input type="text" id="direccion" name="direccion">
                </div>
            </div>
        </div>
        <button id="btn-enviarr" type="submit" class="add-btn">Agregar</button>
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
    document.getElementById("agregar-fila-prov").addEventListener("click",function (){ /*add*/
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