<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saditarea.dao.*" %>
<%@ page import="mx.edu.utez.saditarea.modelo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--Extraxion del dao-->
<%
    ProveedoresDao dao = new ProveedoresDao();
    List<Proveedores> proveedores = dao.findAll();

%>
<%
    ProductosDao daoProducto = new ProductosDao();
    List<Productos> productos= daoProducto.getAll();

%>
<%
    UnidadMedidaDao daoUnidadM = new UnidadMedidaDao();
    List<UnidadMedida> unidadMedida= daoUnidadM.getAll();

%>
<%
    UserDao daoUser = new UserDao();
    List<Usuario> userDao= daoUser.getAll2();
    Usuario usuarioSes = (Usuario) session.getAttribute("usuario");
    System.out.println("USUARIOOOO DESDE EL SERVLET LOGIN: "+ usuarioSes.getNombre1_U() );

    String nombtr = request.getParameter("desde");
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
    <link rel="icon" href="img/apple-touch-icon.png" type="image/png">

</head>
<style>
    .custom-color {
        color: #28a745;
    }

    .add-button:hover {
        background-color: #e6f9ea; /* Color verde brillante al pasar el cursor */
        box-shadow: 0 0 10px 5px #e6f9ea;/* Color verde brillante al pasar el cursor */
    }
    #popup-container {
        display: none; /* Asegúrate de que esté oculto por defecto */
        /* Otros estilos para el modal */
    }
    #close-br {
        background: none; /* Elimina el fondo */
        border: none; /* Elimina el borde */
        padding: 0; /* Elimina el padding */
        margin: 0; /* Elimina el margin si es necesario */
        cursor: pointer; /* Muestra el cursor pointer cuando se pasa sobre el ícono */
    }
    .popup-header {
        display: flex; /* Usa flexbox para el contenedor */
        justify-content: center; /* Centra los elementos horizontalmente */
        align-items: center; /* Alinea los elementos verticalmente */
        position: relative; /* Para posicionar el botón correctamente */
        padding: 10px; /* Espacio alrededor del contenido */
    }

    .popup-header h2 {
        flex: 1; /* Permite que el título ocupe el espacio disponible */
        text-align: center; /* Centra el texto dentro del h2 */
        margin: 0; /* Elimina el margen predeterminado */
    }

    #close-br {
        position: absolute; /* Posiciona el botón en una ubicación específica */
        right: 10px; /* Ajusta la distancia desde el borde derecho */
        top: 50%; /* Centra verticalmente en relación con el encabezado */
        transform: translateY(-50%); /* Ajusta la posición para centrar verticalmente */
    }



</style>
<body>



<div id="capa-obscurecer">

</div>
<div class="d-flex " >
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <a id="logoImg" href=""><img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px" ></a>
                <a id="loginImg" href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
                <div class="hbs"><a href="" id="hbsb"><img src="img/hbs.png" width="50px"></a></div>
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
            <div class="tituloSeccion">
                <h1>ENTRADAS</h1>
            </div>
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
                            <form class="d-flex" action="entradas.jsp" method="post" onsubmit="return validarFechas();">
                                <div class="form-group">
                                    <%--@declare id="desde"--%><label for="Desde">Desde el dia:</label>
                                    <input type="date" class="form-control" id="fechaInicio" name="desde">
                                </div>
                                <span class="ms-auto p-2"></span>
                                <div class="form-group">
                                    <%--@declare id="hasta"--%><label for="Hasta">Hasta el dia:</label>
                                    <input type="date" class="form-control" id="fechaFin" name="hasta"/>
                                </div>
                                <span class="ms-auto p-1"></span>
                                <!--<a href="entradas.jsp?value=''">Enviar</a>-->

                                <div class="form-group" style="margin-top: 4.8%;">
                                    <button type="submit" class="btn btn-outline-success">
                                        <i class="bi bi-search"></i>
                                    </button>
                                </div>

                            </form>
                        </div>
                        <div style="position: relative;">
                            <table class="table table-hover tab">
                                <thead>
                                <tr>
                                    <th class="todisable2">Folio</th>
                                    <th>Numero de factura</th>
                                    <th  class="todisable">Almacenista</th>  <!--style="padding-left: 65px;" -->
                                    <th >Acciones</th> <!--style="padding-left: 45px;"-->
                                    <th></th>
                                    <th style="text-align: right; ">
                                        <i id="agregar-fila" class="bi bi-plus-circle-fill custom-color" style="font-size: 2.5rem; margin-top: -0.5%"></i>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    EntradasDao daoE = new EntradasDao();
                                    UserDao uSS = new UserDao();
                                    List<RegistroEntradas>  lista = new ArrayList<>();
                                    List<Entradas>  listaa = new ArrayList<>(); //BORRAR DESPUES DE LAS PRUEBAS

                                    if(!(request.getParameter("desde") == null) || !(request.getParameter("hasta") == null)) {
                                        String desde = request.getParameter("desde");
                                        String hasta = request.getParameter("hasta");
                                        System.out.println("Desde:"+desde);
                                        System.out.println("Hasta: "+hasta);
                                        lista = daoE.reporteFechas(desde,hasta) ;
                                    }else{
                                        lista = daoE.getAllEntradas() ;
                                    }


                                    int numeroElementos = lista.size();
                                    double numeroPaginadores = (double) numeroElementos/10;
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
                                    for(RegistroEntradas u : lista){
                                        if( contador >= ((paginadorSolicitadoInt * 10)-10) && contador < (paginadorSolicitadoInt * 10)){
                                            System.out.println("Con el paginador: "+paginadorSolicitadoInt);
                                            System.out.println(("contador >= "+((paginadorSolicitadoInt * 10)-10) + "&& contador < "+(paginadorSolicitadoInt * 10) ));
                                %>
                                <!---Se va a repetir --->
                                <tr>
                                    <td class="todisable2"><%=u.getFolioEntrada()%></td>
                                    <td><%=u.getNumeroFacturaE()%></td>
                                    <td class="todisable"><%=uSS.getName(Integer.parseInt(u.getFkEmpleado()))%></td>
                                    <!--<td><a><a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>-Eleminar></a></td> -->
                                    <td id="acc" class="acc">
                                        <a href="ojoEntradas.jsp?folio=<%=u.getFolioEntrada()%>" class="acc">
                                            <img class="act" src="img/visibility_24dp.png">
                                        </a>
                                    </td>
                                </tr>
                                <%} contador++;%>
                                <%} %>
                                </tbody>
                            </table>
                            <nav aria-label="...">
                                <ul id ="pagination" class="pagination">
                                    <li class="page-item ">
                                        <a class="page-link" id="anteriorPaginador" href="entradas.jsp?value=<%=paginadorSolicitadoInt-1%>" >Anterior</a>
                                    </li>
                                    <%
                                        System.out.println("Decimal: "+numeroPaginadores);
                                        System.out.println("Entero: "+numeroPaginadoreDecimal);
                                        for(int i =0; i<numeroPaginadoreDecimal; i++){
                                    %>
                                    <%
                                        if((i+1)==paginadorSolicitadoInt){
                                    %>

                                    <li class="page-item active"><a class="page-link" href="entradas.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                    } else{
                                    %>
                                    <li class="page-item"><a class="page-link" href="entradas.jsp?value=<%=i+1%>" onclick="handleClick(this)"><%=i+1%></a></li>
                                    <%
                                        }
                                    %>
                                    <%
                                        }
                                    %>
                                    <li class="page-item">
                                        <a class="page-link" id="siguientePaginador" href="entradas.jsp?value=<%=paginadorSolicitadoInt+1%>"  >Siguiente</a>
                                    </li>

                                </ul>
                            </nav>


                            <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                                <i class="bi bi-plus-lg"></i>-->

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
<div class="popup-container" id="popup-container255">
    <div class="popup-header text-center">
        <h2>Registro de Productos</h2>
        <div>
            <i class="bi bi-x-circle-fill icon-hover" style="color: #df1616; font-size: 3rem;" id="close-br1"></i>
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
            <button id="btn-enviarr1" type="submit" class="btn btn-primary">Agregar</button>
            <button  style="background-color:#df1616;   background-color: #df1616;  border-color: #df1616;color: white; width: 90px; outline: none;" id="btn-cancelar1" type="button" class="btn btn-primary" onclick="cancelForm()">Cancelar</button>
        </div>
    </form>
</div>
<script>
    document.getElementById('close-br1').addEventListener('click', function() {
        var popup = document.getElementById('popup-container255');
        popup.style.display = 'none'; // Oculta el popup
    });

    function cancelForm() {
        var popup = document.getElementById('popup-container255');
        popup.style.display = 'none'; // Oculta el popup
    }
</script>


<!--formulario de registro (add)-->
<div class="popup-containerIn2" id="popup-container">
    <div class="popup-header">
        <h2>Registro de Entradas</h2>
        <i class="bi bi-x-circle-fill icon-hover" style="color: #df1616; font-size: 3rem; cursor: pointer;" id="close-br"></i>
    </div>

    <form action="registroEntradas" method="post">
        <!-- <button id="close" class="close-btn" >✖</button> -->
        <div class="contenedorInputs3">
            <div class="izquierda3">

                <!--<div class="form-group">
                     <label for="folio-E">Folio:</label>
                    <input type="text" id="folio-E" name="folio-E" required>
                    <input type="hidden" id="folio-E" name="folio-E" required oninput="updateTable(contadorFilas,folio_EG)" readonly>

                </div>-->
                <input type="hidden" id="folio-E" name="folio-E" required oninput="updateTable(contadorFilas, folio_EG)" readonly style="z-index: -5;">
                <div class="form-group">
                    <label for="nombreCompleto">Nombre del proveedor: </label>
                    <select id="nombreCompleto" name="nombreCompleto" required oninput="updateTable(contadorFilas,folio_EG)">

                        <%
                            if (proveedores != null) {
                                for (Proveedores usuario : proveedores) {
                        %>
                        <option value="<%= usuario.getRFC()%>" title="ID: <%= usuario.getRFC()%> - Nombre: <%= usuario.getNombre1_P()%>" ><%= usuario.getNombre1_P()%> <%= usuario.getNombre2_P()%> <%= usuario.getApellido1_P()%> <%= usuario.getApellido2_P()%></option>
                        <%
                            }
                        }else {
                        %>
                        <option value="">No hay usuarios disponibles</option>
                        <%
                            }
                        %>

                    </select>

                </div>

                <div class="form-group">

                    <div class="form-group">
                        <label for="nombreCompletoAlmacenista">Nombre del almacenista : </label>
                        <!--<input id="nombreCompletoAlmacenista" name="nombreCompletoAlmacenista" data-usuarioSesion="<%=usuarioSes.getId()%>" value="<%=usuarioSes.getId()%>" oninput="updateTable(contadorFilas,folio_EG)" readonly required >-->
                        <input type="text" readonly id="nombreCompletoAlmacenista" value="<%=usuarioSes.getNombre1_U()+" " + usuarioSes.getApellido2_U()+" " + usuarioSes.getApellido1_U()+" " + usuarioSes.getApellido2_U()%>">

                    </div>
                </div>
                <div class="form-group">
                    <script>
                        document.addEventListener('DOMContentLoaded', function() {
                            function updateUnitMeasure() {
                                var selectedOption = document.getElementById('product').options[document.getElementById('product').selectedIndex];
                                var selectedOptionU = document.getElementById('nombreCompletoAlmacenista').options[document.getElementById('nombreCompletoAlmacenista').selectedIndex];
                                var unidadMedida = selectedOption.getAttribute('data-unidad');
                                let precio = selectedOption.getAttribute('data-precio');
                                //let almacenistaSesion = selectedOptionU.getAttribute('data-usuarioSesion')

                                document.getElementById('unit').value = unidadMedida;
                                document.getElementById('unit-price').value = precio;
                            }

                            // Ejecutar la función al cargar la página
                            updateUnitMeasure();

                            // Y también cuando se cambie el select
                            document.getElementById('product').addEventListener('change', updateUnitMeasure);
                        });
                    </script>
                    <label for="unit">Unidad de medida:</label>
                    <input id="unit" value="" name="unit" readonly oninput="updateTable(contadorFilas,folio_EG)" >
                </div>


                <div class="form-group">
                    <label for="unit-price">Precio Unitario :</label>
                    <input type="number" id="unit-price" name="unit-price" required  oninput="updateTable(contadorFilas,folio_EG)">
                </div>

            </div>

            <div class="derecha3">
                <!--<button id="close" class="close-btn" >✖</button>-->
                <div class="form-group">
                    <label for="billing-number">Número de facturación:</label>
                    <input type="text" id="billing-number" name="billing-number"  required oninput="updateTable(contadorFilas,folio_EG)">
                </div>
                <div class="form-group">
                    <label for="entry-date">Fecha de entrada:</label>
                    <input type="date" id="entry-date" name="entry-date" required oninput="updateTable(contadorFilas,folio_EG)">
                </div>

                <div class="form-group" id="agregar-producto-desde-Entrada">
                    <label for="product">Producto:</label>
                    <select id="product" name="product" required oninput="updateTable(contadorFilas,folio_EG)" >
                        <%
                            if (productos != null) {
                                for (Productos producto : productos) {
                        %>
                        <option value="<%= producto.getClaveProducto() %>" data-unidad="<%= producto.getUnidadMedida() %>" data-precio="<%= daoProducto.obtenerPrecio(producto.getClaveProducto())%>" title="Precio: <%= daoProducto.obtenerPrecio(producto.getClaveProducto())%> "><%= producto.getNombreProducto() %></option>
                        <%
                            }
                        } else {
                        %>
                        <option value="">No existen productos</option>
                        <%
                            }
                        %>
                    </select>
                </div>

                <div class="form-group">
                    <label for="quantity">Cantidad:</label>
                    <input type="number" id="quantity" name="quantity" required oninput="updateTable(contadorFilas,folio_EG)">
                </div>

                <!--
                <div class="form-group">
                     <label for="total-price">Precio total de productos:</label>
                    <input type="hidden" id="total-price" name="total-price" value="10.00" required oninput="updateTable(contadorFilas,folio_EG)" style="z-index: -5;">
                </div>
                -->
                <input type="hidden" id="total-price" name="total-price" value="10.00" required oninput="updateTable(contadorFilas,folio_EG)" style="z-index: -5;">

            </div>
        </div>
        <!--<button id="btn-enviarr" type="submit" class="btn-to-actions">Agregar</button>-->
        <!-- <a id="add-desdeEntrada" class="btn-to-actions" href="entradas.jsp"><img src="img/add-removebg-preview.png"width="80px"></a> -->

        <!-- <a id="btn-backl" href="regEntrada?data=" class="btn-to-actions">Registrar Entrada</a> -->
        <button  style="background-color: #306AFE; border-color: #306AFE" id="agregar-fila2" type="button" class="btn btn-primary btn-8m" >Agregar producto</button>
        <button style="background-color: #306AFE; border-color: #306AFE" id="add-entradaa" type="button" class="btn btn-primary btn-8m">Agregar entrada</button>
        <button style="background-color: green; border-color: green; padding-inline: initial" id="btn-backl" type="button" class="btn btn-primary btn-8m" onclick="submitForm()">Registrar Entrada</button>


    </form>

</div>
<div class="previewEntradas" id="previewEntradas">

    <table class="table">
        <thead>

        <tr>
            <th>Folio</th>
            <th>Nombre Proveedor</th>
            <th class="todisable2">Nombre Almacenista</th>
            <th class="todisable">Unidad de medida</th>
            <th class="todisable">Precio Unitario</th>
            <th class="todisable2">Numero facturacion</th>
            <th class="todisable">Fecha de Entrada</th>
            <th >Producto</th>
            <th class="todisable">Cantidad</th>
            <th>Total</th>
        </tr>
        </thead>
        <tbody id="tbody-table-preview">
        <!--
        <tr>
            <td id="col1">

            </td>
            <td>
                Data del dato2
            </td>
        </tr>
        -->
        </tbody>
        <!--
        <script>

            function updateTable() {
                let contadorr = 1;
                let datoImprimir;
                const folio_E = document.getElementById("folio-E").value;
                const inputP = document.getElementById('nombreCompleto');
                const Proveedor = inputP.options[inputP.selectedIndex].text;

                const values = [
                    document.getElementById("folio-E").value,
                    (document.getElementById("nombreCompleto")).options[inputP.selectedIndex].text
                    // ... agrega los otros valores aquí
                ];

                const columns = [
                    document.getElementById("col1"),
                    document.getElementById("col2"),
                    document.getElementById("col3"),
                    document.getElementById("col4"),
                    document.getElementById("col5"),
                    document.getElementById("col6"),
                    document.getElementById("col7"),
                    document.getElementById("col8"),
                    document.getElementById("col9"),
                    document.getElementById("col10")
                ];
                columns.forEach((column, index) => {
                    column.value = values[index];
                });
            }

        </script>
        -->

    </table>
</div>
<script>

    let folio_EG = null;

    function generarCodigo() {
        const numerosAleatorios = Math.floor(1000 + Math.random() * 9000);
        //let uno = 1;
        return `E-2024-`+numerosAleatorios;
    }


    let contadorFilas = 0;
    let contador = 1;
    const add_entradas = document.getElementById("add-entradaa");
    const previewEmtradas = document.getElementById("previewEntradas")
    const elemento = document.getElementById("item-responsive");
    const desboardItems = document.getElementById("dashboard-items-responsive");
    const accioness = document.getElementById("setting-items-responsive");
    const acciones = document.getElementById("acciones");
    const reportes = document.getElementById("reportess");
    const reportess = document.getElementById("profile-items-responsive");
    const hamburguesa = document.getElementById("hbsb");
    const menu = document.getElementById("sidebar-accordion-responsive");
    let registro = [];
    let conjuntoRegistros = [];

    let contadorGenerarCodigoNone = 0;
    let contadorGenerarCodigoBlock = 0;
    let multiplo = -1;
    let stop = false;
    add_entradas.addEventListener("click",function (){
        multiplo++;
        if(contadorGenerarCodigoNone < 1){
            folio_EG = generarCodigo();
        }

        contadorGenerarCodigoNone++;
        // console.log("Codigo generado en la compu "+folio_E);
        //console.log("si hace click añadir entrada");
        if(document.getElementById("previewEntradas").style.display === "block"){
            const valores = dataInput();
            stop = valores.some(val => {
                if(val == null || val === '' || val === ""){
                    // alert("DEBES TERMINAR DE RESGISTRAR ESTA ENTRADA")
                    $('#customAlertModal2').modal('show');
                    return true; // Detiene la iteración cuando se cumple la condición
                }
                return false;
            });
            //console.log("Se detuvo: "+stop);
            if(stop === false){
                console.log("----------------despues de segunda vez----------------")
                contadorFilas++;
                hacerFila(multiplo);

                dataBD().forEach((element)=>{
                    console.log(element);
                    registro.push(element);
                });

                conjuntoRegistros.push(registro);
                console.log(conjuntoRegistros);
                registro = [];
                /*for(let z=0;z<=(conjuntoRegistros.length);z++){
                    for(let t = 0; t<(conjuntoRegistros[z]);t++){
                        console.log("Registro "+(z+1)+" Dato "+conjuntoRegistros[z].value);
                    }
                }*/

            }
        }else{
            console.log("Es la primera vez que agregas una entrada")
            document.getElementById("previewEntradas").style.display = "block";
            //console.log("Valor del multiplo: "+multiplo);
            hacerFila(multiplo);
            //console.log("SE ESTA CREANDO LA FILA CON L AFUNCIÓN")
            updateTable(contadorFilas,folio_EG)
        }

        //console.log("Conteo de filas:"+contadorFilas);
        //console.log("AHORAAAAAA SIIIIIIIIIIII")
        /*for(let i = 0; i < conjuntoRegistros.length; i++){
            for(j = 0; j<registro.length;j++){
                console.log("REGISTRO "+i+" Valor: "+registro[j]);
            }
        }*/

        //return folio_EG;
        updateTable(contadorFilas,folio_EG);
    })

    function updateTable(cont,folio) {
        //console.log("LO QUE CUANTA LOS REGISTROS ES"+cont);
        let columns = [];
        //let contadorr = 1;
        let datoImprimir;
        /*data*/
        let folio_E = folio /*document.getElementById("folio-E").value;*/
        document.getElementById("folio-E").value = folio_E;
        const inputP = document.getElementById('nombreCompleto');
        const proveedor = inputP.options[inputP.selectedIndex].text;
        const inputA = document.getElementById("nombreCompletoAlmacenista");
        const almacenista = inputA.options[inputA.selectedIndex].text;
        /*const inputUM =  document.getElementById("unit");
        const unidadMedida = inputUM.options[inputUM.selectedIndex].text;*/
        const unidadMedida = document.getElementById("unit").value;
        const precioUnitario = document.getElementById("unit-price").value;
        const numeroFaturacion = document.getElementById("billing-number").value;
        const fecha = document.getElementById("entry-date").value;

        const inputPr = document.getElementById('product');
        const Producto = inputPr.options[inputPr.selectedIndex].text;
        const cantidad = document.getElementById("quantity").value;
        const total = document.getElementById("total-price").value;


        if(cont > 0){
            //console.log("YA SE ANDA CON LOS DE 11-20");
            //console.log("colums antes de limpiar: "+columns);
            columns = [];
            //console.log("colums despues de limpiar: "+columns)
            for (let i = 1; i <= 10; i++) {
                console.log("col" + (contador * 10 + i))
                columns.push(document.getElementById("col" + (cont * 10 + i)));
            }
            console.log("columns ahora: "+columns)
        }else{
            //console.log("ANDAN CON LOS DE 1-10");
            for (let i = 1; i <= 10; i++) {
                columns.push(document.getElementById("col"  + i));
            }
        }

        columns.forEach(column => {
            switch (column.id) {
                case columns[0].id:
                    datoImprimir =folio_E;
                    //console.log("col1: "+datoImprimir)
                    break;
                case columns[1].id:
                    datoImprimir =proveedor;
                    // console.log("col2: "+datoImprimir)
                    break;
                case columns[2].id:
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    datoImprimir =almacenista;
                    //console.log("col2: "+datoImprimir)
                    break;
                case columns[3].id:
                    datoImprimir =unidadMedida;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[4].id:
                    datoImprimir = precioUnitario;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[5].id:
                    datoImprimir = numeroFaturacion;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[6].id:
                    datoImprimir = fecha;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[7].id:
                    datoImprimir = Producto;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[8].id:
                    datoImprimir = cantidad;
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                case columns[9].id:
                    datoImprimir = cantidad*precioUnitario;
                    //console.log("Cantidad:"+cantidad);
                    //console.log("Precio: "+precioUnitario)
                    //console.log("Total: "+datoImprimir);
                    //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
                    break;
                default:
                    //console.log("Nadie recibio pibito");
                    break;
            }
            column.innerText = datoImprimir;
        });
        //console.log("EL CONTADOR DE UPDATE TABLE: "+contadorr)
        //contadorr++;
    }

    /*function hacerFila(){
        let tr = document.createElement("tr");
        for(let i = 0; i<10;i++){
            const td = document.createElement("td");
            td.id = "col" + (i + 1);
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }*/

    function dataInput(){
        let folio_E = document.getElementById("folio-E").value = folio_EG;
        const proveedorId = document.getElementById('nombreCompleto').value;
        const inputP = document.getElementById('nombreCompleto');
        const proveedor = inputP.options[inputP.selectedIndex].text;
        const almacenistaId = document.getElementById("nombreCompletoAlmacenista").value;
        const inputA = document.getElementById("nombreCompletoAlmacenista");
        const almacenista = inputA.options[inputA.selectedIndex].text;
        const unidadMedidaId =  document.getElementById("unit").value;
        const unidadMedida =  document.getElementById("unit").value;
        /*const unidadMedida = inputUM.options[inputUM.selectedIndex].text;*/
        const precioUnitario = document.getElementById("unit-price").value;
        const numeroFaturacion = document.getElementById("billing-number").value;
        const fecha = document.getElementById("entry-date").value;
        const productoId = document.getElementById('product').value;
        const inputPr = document.getElementById('product');
        const Producto = inputPr.options[inputPr.selectedIndex].text;
        const cantidad = document.getElementById("quantity").value;
        const total = document.getElementById("total-price").value;

        const valoresInput = [
            folio_E,
            proveedor,
            almacenista,
            unidadMedida,
            precioUnitario,
            numeroFaturacion,
            fecha,
            Producto,
            cantidad,
            total
        ]
        return valoresInput;
    }

    function dataBD(){
        let folio_E = document.getElementById("folio-E").value = folio_EG;
        const proveedorId = document.getElementById('nombreCompleto').value;
        const inputP = document.getElementById('nombreCompleto');
        const proveedor = inputP.options[inputP.selectedIndex].text;
        const almacenistaId = document.getElementById("nombreCompletoAlmacenista").value;
        const inputA = document.getElementById("nombreCompletoAlmacenista");
        const almacenista = inputA.options[inputA.selectedIndex].text;
        const unidadMedidaId =  document.getElementById("unit").value;
        const unidadMedida =  document.getElementById("unit").value;
        /*const unidadMedida = inputUM.options[inputUM.selectedIndex].text;*/
        const precioUnitario = document.getElementById("unit-price").value;
        const numeroFaturacion = document.getElementById("billing-number").value;
        const fecha = document.getElementById("entry-date").value;
        const productoId = document.getElementById('product').value;
        const inputPr = document.getElementById('product');
        const Producto = inputPr.options[inputPr.selectedIndex].text;
        const cantidad = document.getElementById("quantity").value;
        const total = document.getElementById("total-price").value;

        const valoresInputParaBD = [
            folio_E,
            proveedorId,
            almacenistaId,
            unidadMedidaId,
            precioUnitario,
            numeroFaturacion,
            fecha,
            productoId,
            cantidad,
            (precioUnitario * cantidad)
        ]
        return valoresInputParaBD;
    }

    function hacerFila(multiplo){
        const tbody = document.getElementById("tbody-table-preview");
        let tr = document.createElement("tr");
        for(let i = (multiplo*10); i<((multiplo+1)*10);i++){
            const td = document.createElement("td");
            td.id = "col" + (i + 1);
            if(((i+1)>=4 && (i+1)<= 5) || (i+1) == 7 || (i+1) ==9){
                td.className = "todisable";
            }else if((i+1)==3 || (i+1)==6){
                td.className = "todisable2";
            }
            tr.appendChild(td);
        }
        tbody.appendChild(tr);
    }


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

    document.getElementById("agregar-fila2").addEventListener("click",function (){ /*add*/
        // alert("si se da clic");
        let pop = document.getElementById("popup-container255");
        // let capa = document.getElementById("capa-obscurecer");
        let paginador = document.getElementById("pagination");
        if(pop.style.display === "none"){
            pop.style.display = "block";
            capa.style.zIndex = 5;
            pop.style.zIndex = 6;
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
    document.getElementById("close").addEventListener("click",function (){
        document.getElementById("previewEntradas").style.display = "none";
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
        location.reload()
    })

    function noScroll() {
        //window.scrollTo(0, 0);

    }
</script>

<form id="form-reg-entrada" action="regEntrada" method="POST">
    <input type="hidden" name="data" id="data">
</form>
<script>
    function checarDataLista(){
        let folio_E = document.getElementById("folio-E").value;
        const proveedorId = document.getElementById('nombreCompleto').value;
        const inputP = document.getElementById('nombreCompleto');
        const proveedor = inputP.options[inputP.selectedIndex].text;
        const almacenistaId = document.getElementById("nombreCompletoAlmacenista").value;
        const inputA = document.getElementById("nombreCompletoAlmacenista");
        const almacenista = inputA.options[inputA.selectedIndex].text;
        const unidadMedidaId =  document.getElementById("unit").value;
        const unidadMedida =  document.getElementById("unit").value;
        /*const unidadMedida = inputUM.options[inputUM.selectedIndex].text;*/
        const precioUnitario = document.getElementById("unit-price").value;
        const numeroFaturacion = document.getElementById("billing-number").value;
        const fecha = document.getElementById("entry-date").value;
        const productoId = document.getElementById('product').value;
        const inputPr = document.getElementById('product');
        const Producto = inputPr.options[inputPr.selectedIndex].text;
        const cantidad = document.getElementById("quantity").value;
        const total = document.getElementById("total-price").value;

        const valoresInput = [
            folio_E,
            proveedor,
            almacenista,
            unidadMedida,
            precioUnitario,
            numeroFaturacion,
            fecha,
            Producto,
            cantidad,
            total
        ];

        let stop = false;
        stop = valoresInput.some(val => {
            //console.log("El valor del valor es: "+val)
            if(val == null || val === '' || val === ""){
                //alert("EEE CAUSITA, ACABA ESTA PRIMERO")
                return true; // Detiene la iteración cuando se cumple la condición
            }
            return false;
        });

        return stop;
    }


    function submitForm() {
        //console.log("SI SE LLAMA A LA FUNCIÓN DE SALIDA ENVIAR")
        if(checarDataLista()){
            $(document).ready(function() {
                $('#customAlertModal').modal('show');
            });
            //alert("NO PUEDES REGISTRAR UNA ENTRADA INCOMPLETA");
        }else{
            //add_entradas.click();
            dataBD().forEach((element)=>{
                registro.push(element) ;
            });
            conjuntoRegistros.push(registro);/*
            console.log("------------------------------DATOS A ENVIARSE-------------------------------")
            for(let z=0;z<=(conjuntoRegistros.length);z++){
                for(let t = 0; t<(conjuntoRegistros[z]);t++){
                    console.log("Registro "+(z+1)+" Dato "+conjuntoRegistros[z].value);
                }
            }*/
            let arrayOfArrays = conjuntoRegistros;

            // Convertir el arreglo de arreglos a JSON
            document.getElementById('data').value = JSON.stringify(arrayOfArrays);
            console.log(arrayOfArrays)

            // Enviar el formulario
            document.getElementById('form-reg-entrada').submit();
        }


    }
    document.addEventListener('DOMContentLoaded', function() {
        // Cerrar el popup al hacer clic en el ícono de cierre
        document.getElementById('close-br').addEventListener('click', function() {
            var popup = document.getElementById('popup-container');
            popup.style.display = 'none'; // Oculta el popup
            var capa = document.getElementById('capa-obscurecer');
            capa.style.zIndex = -1;
            capa.style.backgroundColor = 'rgba(255,255,255,0)';
        });

        // Función para cerrar el popup cuando se cancela el formulario
        function cancelForm() {
            var popup = document.getElementById('popup-container');
            popup.style.display = 'none'; // Oculta el popup
            var capa = document.getElementById('capa-obscurecer');
            capa.style.zIndex = -1;
            capa.style.backgroundColor = 'rgba(255,255,255,0)';
        }

        // Asignar la función de cancelar al botón correspondiente
        //document.getElementById('btn-backl').addEventListener('click', submitForm);
    });
    document.getElementById('close-br').addEventListener('click', function() {
        var popup = document.getElementById('popup-container');
        var previewEntradas = document.getElementById('previewEntradas');

        // Oculta el popup
        popup.style.display = 'none';
        // Oculta el contenedor de vistas previas
        previewEntradas.style.display = 'none';
    });


</script>
<!--
<div id="contenedorFormProductoEntradas">
    <div id="capa-obscurecer-agregar-desdeEntradas"></div>
    <div id="formulario-registro-entradas-producto">
        <div class="popup-header">
            <h2>Registro de Productos</h2>
            <button  class="close-btn" id="closeE">✖</button>
        </div>
        <form method="post" action="registroProducto">
            <div class="contenedorInputs">
                <div class="izquierda">
                    <div class="form-group">
                        <label for="rfc">Clave</label>
                        <input type="text" id="rfc" name="clave" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre1">Nombre Producto:</label>
                        <input type="text" id="nombre1" name="nombre" required>
                    </div>

                </div>
                <div class="derecha">
                    <div class="form-group">
                        <label for="nombre2A">Descripción:</label>
                        <input type="text" id="nombre2A" name="descipcion" placeholder="Opcional" required>
                    </div>

                </div>
            </div>
            <button id="btn-enviarr" type="submit" class="add-btn">Agregar</button>
        </form>
    </div>
    -->
<script>
    const cerrarFormularioDesdeEntradas = document.getElementById("closeE");
    const contenedorFormProductoEntradas = document.getElementById("contenedorFormProductoEntradas"); //1
    const capa_obscurecer_agregar_desdeEntradas = document.getElementById("capa-obscurecer-agregar-desdeEntradas");//2
    const formulario_registro_entradas_producto = document.getElementById("formulario-registro-entradas-producto");//3
    const abrirFormularioProductoDesdeEntradas = document.getElementById("agregar-producto-desde-Entrada");
    /*
            abrirFormularioProductoDesdeEntradas.addEventListener("click",function (){
                contenedorFormProductoEntradas.style.display = "block";
                formulario_registro_entradas_producto.style.display = "block";
            })

            cerrarFormularioDesdeEntradas.addEventListener("click",function (){
                contenedorFormProductoEntradas.style.display = "none";
                formulario_registro_entradas_producto.style.display = "none";
            })
            */
</script>

</div>
-->


<div class="modal fade" id="customAlertModal" tabindex="-1" role="dialog" aria-labelledby="customAlertModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customAlertModalLabel">Atención</h5>
                <!--
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                -->
            </div>
            <div class="modal-body">
                NO PUEDES REGISTRAR UNA ENTRADA INCOMPLETA
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal para la nueva alerta -->
<div class="modal fade" id="customAlertModal2" tabindex="-1" role="dialog" aria-labelledby="customAlertModalLabel2" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="customAlertModalLabel2">Advertencia</h5>
                <!--
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                -->
            </div>
            <div class="modal-body">
                DEBES TERMINAR DE REGISTRAR ESTA ENTRADA
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-warning" data-dismiss="modal">Entendido</button>
            </div>
        </div>
    </div>
</div>



<!--Funcion de la alerta en registro de fecha -->
<script>
    function validarFechas() {
        const fechaInicio = document.getElementById('fechaInicio').value;
        const fechaFin = document.getElementById('fechaFin').value;
        const hoy = new Date().toISOString().split('T')[0];
        if (fechaInicio === '' || fechaFin === '') {
            Swal.fire("Por favor, seleccione ambas fechas.");
            return false;
        }

        if (fechaInicio > fechaFin) {
            Swal.fire("La fecha de inicio no puede ser mayor que la fecha de fin.");
            return false;
        }

        if (fechaInicio < fechaActual || fechaFin < fechaActual) {
            Swal.fire("No se pueden seleccionar fechas anteriores al día actual.");
            return false;
        }

        return true;
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>