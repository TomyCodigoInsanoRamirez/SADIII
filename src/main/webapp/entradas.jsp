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

</head>

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
                                <a href="home.jsp"
                                   class="list-group-item list-group-item-action bg-coffe text-light pl-5 mb-1 item-list-res" >
                                    <i class="bi bi-people-fill mr-3 " aria-hidden="true"></i>
                                    Usuarios
                                </a>
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
                               class="list-group-item list-group-item-action bg-coffee text-light  mb-2" id="acciones">
                                <i class="fa fa-cog mr-3" aria-hidden="true"></i>Acciones
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
                                        <a href="home.jsp"
                                           class="list-group-item list-group-item-action bg-coffe text-light pl-5 mb-1">
                                            <i class="bi bi-people-fill mr-3" aria-hidden="true"></i>
                                            Usuarios
                                        </a>
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
                                       class="list-group-item list-group-item-action bg-coffee text-light  mb-2">
                                        <i class="fa fa-cog mr-3" aria-hidden="true"></i>Acciones
                                    </a>
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
                            <form class="d-flex" role="search">
                                <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search" style="width: 200px;">
                                <button class="btn btn-outline-success" type="submit" style="margin-left: 5px;"><i class="bi bi-search"></i>
                                </button>
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
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    EntradasDao daoE = new EntradasDao();
                                    List<Entradas> lista = daoE.getAll();
                                    for(Entradas u : lista){ %>
                                <!---Se va a repetir --->
                                <tr>
                                    <td class="todisable2"><%=u.getFolio_E()%></td>
                                    <td><%=u.getNumero_Factura()%></td>
                                    <td class="todisable"><%=u.getId_Empleado()%></td>
                                    <!--<td><a><a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>-Eleminar></a></td> -->
                                    <td id="acc" class="acc"><a href="visualizar.jsp"class="acc"><img class="act" src="img/visibility_24dp.png" ></a></td>

                                </tr>
                                <%} %>
                                <!--
                                <tr>
                                    <td>1</td>
                                    <td>Enrique Landa</td>
                                    <td class="todisable"><a href="mailto:20235tn174@utez.edu.mx">20235tn174@utez.edu.mx</a></td>
                                    <td class="acciones">
                                        <a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                                        <a href="editar.jsp" style="margin:10px"><i class="bi bi-pencil-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                                        <template>
                                            <div>
                                                <b-form-checkbox v-model="checked" name="check-button" switch>
                                                    Switch Checkbox <b>(Checked: {{ checked }})</b>
                                                </b-form-checkbox>
                                            </div>
                                        </template>
                                    </td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Enrique Landa</td>
                                    <td class="todisable"><a href="mailto:20235tn174@utez.edu.mx">20235tn174@utez.edu.mx</a></td>
                                    <td class="acciones">
                                        <a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                                        <a href="editar.jsp" style="margin:10px"><i class="bi bi-pencil-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                                        <template>
                                            <div>
                                                <b-form-checkbox v-model="checked" name="check-button" switch>
                                                    Switch Checkbox <b>(Checked: {{ checked }})</b>
                                                </b-form-checkbox>
                                            </div>
                                        </template>
                                    </td>
                                </tr>
                                -->
                                </tbody>
                            </table>
                            <!--<button id="agregar-fila" class="btn btn-primary btn-circular" style="border-radius: 100%; border: 0; position: absolute; top: -15px; right: -15px; background-color: #1e863f;">
                                <i class="bi bi-plus-lg"></i>-->
                            <img src="img/add-removebg-preview.png" width="90px" id="agregar-fila">
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
        <h2>Registro de Entradas</h2>
        <button  class="close-btn" id="close">✖</button>
    </div>
    <form action="registroEntradas" method="post">
        <!-- <button id="close" class="close-btn" >✖</button> -->
        <div class="contenedorInputs">
            <div class="izquierda">

                <div class="form-group">
                    <label for="folio-E">Folio:</label>
                    <input type="text" id="folio-E" name="folio-E" required>
                </div>
                <div class="form-group">
                    <label for="nombreCompleto">Nombre del proveedor: </label>
                    <select id="nombreCompleto" name="nombreCompleto" required>

                        <%
                            if (proveedores != null) {
                                for (Proveedores usuario : proveedores) {
                        %>
                        <option value="<%= usuario.getRFC()%>"><%= usuario.getNombre1_P()%> <%= usuario.getNombre2_P()%> <%= usuario.getApellido1_P()%> <%= usuario.getApellido2_P()%></option>
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
                        <label for="nombreCompletoAlmacenista">Nombre completo del almacenista receptor: </label>
                        <select id="nombreCompletoAlmacenista" name="nombreCompletoAlmacenista" required>

                            <%
                                if (userDao != null) {
                                    for (Usuario usuario : userDao) {
                            %>
                            <option value="<%= usuario.getId()%>"><%= usuario.getNombre1_U()%> <%= usuario.getNombre2_U()%> <%= usuario.getApellido1_U()%> <%= usuario.getApellido2_U()%></option>
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
                        <label for="unit">Unidad de medida:</label>
                        <select id="unit" name="unit" required>
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

                </div   >


                <div class="form-group">
                    <label for="unit-price">Precio Unitario :</label>
                    <input type="number" id="unit-price" name="unit-price" required>
                </div>

            </div>
            <div class="derecha">
                <!--<button id="close" class="close-btn" >✖</button>-->
                <div class="form-group">
                    <label for="billing-number">Número de facturación:</label>
                    <input type="text" id="billing-number" name="billing-number" required>
                </div>
                <div class="form-group">
                    <label for="entry-date">Fecha de entrada:</label>
                    <input type="date" id="entry-date" name="entry-date" required>
                </div>
                <div class="form-group">
                    <label for="product">Producto:</label>
                    <select id="product" name="product" required>
                        <%
                            if (productos != null) {
                                for (Productos producto : productos) {
                        %>
                        <option value="<%= producto.getClaveProducto() %>"><%= producto.getNombreProducto() %></option>
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
                    <input type="number" id="quantity" name="quantity" required>
                </div>

                <div class="form-group">
                    <label for="total-price">Precio total de productos:</label>
                    <input type="number" id="total-price" name="total-price" required>
                </div>



            </div>
        </div>
        <button id="btn-enviarr" type="submit" class="btn-to-actions">Agregar</button>
        <a id="add-desdeEntrada" class="btn-to-actions">Agregar Producto</a>
        <a id="btn-backl" href="entradas.jsp" class="btn-to-actions">Volver</a>    </form>
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