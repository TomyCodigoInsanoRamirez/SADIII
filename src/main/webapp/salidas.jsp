<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="mx.edu.utez.saditarea.dao.*" %>
<%@ page import="mx.edu.utez.saditarea.modelo.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  UnidadMedidaDao daoUnidadM = new UnidadMedidaDao();
  List<UnidadMedida> unidadMedida= daoUnidadM.getAll();
%>
<%
  ProductosDao daoProductos = new ProductosDao();
  List<Productos> Productos= daoProductos.getAll();
  Productos producto = new Productos();
%>
<%
  AreasDao daoArea = new AreasDao();
  List<Areas> Areas= daoArea.getAll();

%>
<%
  UserDao daoUser = new UserDao();
  List<Usuario> userDao= daoUser.getAll2();
  Usuario usuarioSes = (Usuario) session.getAttribute("usuario");

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
  .popup-header h2 {
    flex: 1; /* Permite que el título ocupe el espacio disponible */
    text-align: center; /* Centra el texto dentro del h2 */
    margin: 0; /* Elimina el margen predeterminado */
  }

  .table-wrapper {
    position: relative;
  }
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
    font-size: 2.8rem;
    border: none;
  }
  .add-button:hover {
    background-color: #e6f9ea; /* Color verde brillante al pasar el cursor */
    box-shadow: 0 0 10px 5px #e6f9ea;/* Color verde brillante al pasar el cursor */
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
              </div>
            </div>
          </div>

        </div>
      </a>
      <div class="tituloSeccion">
        <h1>SALIDAS</h1>
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
              <form class="d-flex" action="salidas.jsp" method="post" onsubmit="return validarFechas();">
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

                <!--
                <span class="ms-auto p-3"></span>
                <div class="form-group" style="margin-top: 29px;">
                    <input class="form-control me-2" type="search" placeholder="Buscar" aria-label="Search" style="width: 200px;">
                </div>
                <span class="ms-auto p-1"></span>

                <div class="form-group">
                    <button class="btn btn-outline-success" type="submit" style="margin-top: 78%;">
                        <i class="bi bi-search"></i>
                    </button>
                </div>
                -->
              </form>
            </div>
            <div style="position: relative;">
              <table class="table table-hover tab">
                <thead>
                <tr>
                  <th class="todisable2">Folio</th>
                  <th>Almacenista (Recibió)</th>
                  <th  class="todisable">Almacenista (Envío)</th>  <!--style="padding-left: 65px;" -->
                  <th>Fecha</th>
                  <th> Área</th>
                  <th id="columnaAcciones">Acciones
                  <th></th>
                  <button id="agregar-fila" type="button" class="btn add-button">
                    <i class="bi bi-plus-circle-fill custom-color"></i>
                  </button>
                  </th>
                </tr>
                </thead>
                <tbody id="tabla-body">
                <%
                  SalidasDao daoE = new SalidasDao();
                  //List<Salidas> lista = daoE.getAll();
                  List<registro_salida>  lista = new ArrayList<>();
                  if(!(request.getParameter("desde") == null) || !(request.getParameter("hasta") == null)) {
                    String desde = request.getParameter("desde");
                    String hasta = request.getParameter("hasta");
                    lista = daoE.reporteFechasS(desde,hasta) ;
                  }else{
                    lista = daoE.getAll() ;
                  }

                  for(registro_salida u : lista){ %>
                <!---Se va a repetir --->
                <tr>
                  <td class="todisable2"><%=u.getFolio_salida()%></td>
                  <td><%=daoUser.getName(Integer.parseInt(u.getFk_almacenistaE()))%></td>
                  <td class="todisable"><%=daoUser.getName(Integer.parseInt(u.getFk_almacenistaR()))%></td>
                  <td><%=u.getFecha_entrada()%></td>
                  <td><%=daoArea.getNameArea(u.getArea())%></td>
                  <!--<td><a><a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill" style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>-Eleminar></a></td> -->
                  <td id="acc" class="acc"><a href="ojoSalidas.jsp?folio=<%=u.getFolio_salida()%>"class="acc"><img class="act" src="img/visibility_24dp.png" ></a></td>

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
<div class="popup-containerIn2" id="popup-container">
  <div class="popup-header">
    <h2>Registro de Salidas</h2>
    <i class="bi bi-x-circle-fill icon-hover" style="color: #df1616; font-size: 3rem; cursor: pointer;" id="close-br"></i>
  </div>
  <form action="registroSalidas" method="post">
    <!-- <button id="close" class="close-btn" >✖</button> -->
    <div class="contenedorInputsOut">
      <div class="izquierda3">
        <div class="form-group">
          <label for="folio_S">Folio:</label>
          <input type="text" id="folio_S" name="folio_S" oninput="updateTable(contadorFilas,folio_EG)">
        </div>
        <div class="form-group">
          <label for="empleado_R">Empleado que recibe:</label>
          <select id="empleado_R" name="receiver-name" oninput="updateTable(contadorFilas,folio_EG)">

            <%
              if (userDao != null) {
                for (Usuario usuario : userDao) {
            %>
            <option title="ID: <%= usuario.getId()%> - Nombre: <%= usuario.getNombre1_U()%>" value="<%= usuario.getId()%>"><%= usuario.getNombre1_U()%> <%= usuario.getNombre2_U()%> <%= usuario.getApellido1_U()%> <%= usuario.getApellido2_U()%></option>
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
          <label for="fecha">Fecha de Salida:</label>
          <input type="date" id="fecha" name="fecha" oninput="updateTable(contadorFilas,folio_EG)">
        </div>
        <div class="form-group">
          <label for="claveProducto"> Producto:</label>
          <select  id="claveProducto" name="claveProducto" oninput="updateTable(contadorFilas,folio_EG)">
            <%
              if (Productos != null) {
                for (Productos Producto: Productos) {
            %>
            <option value="<%= Producto.getClaveProducto() %>" data-unidad="<%= Producto.getUnidadMedida() %>" data-precio="<%= daoProductos.obtenerPrecio(Producto.getClaveProducto())%>" title="Precio: <%= daoProductos.obtenerPrecio(Producto.getClaveProducto())%> "><%= Producto.getNombreProducto()%></option>
            <%
              }
            } else {
            %>
            <option value="">No hay claves disponibles</option>
            <%
              }
            %>
          </select>
        </div>
        <div class="form-group">
          <input type="hidden" disabled >
        </div>
        <div class="form-group">
          <input type="hidden" disabled >
        </div>

      </div>
      <div class="derecha3">
        <!--<button id="close" class="close-btn" >✖</button>-->
        <div class="form-group">
          <label for="empleado_E">Empleado que envía:</label>
          <input type="text" id="empleado_E" readonly  value="<%=usuarioSes.getNombre1_U()+" " + usuarioSes.getApellido2_U()+" " + usuarioSes.getApellido1_U()+" " + usuarioSes.getApellido2_U()%>">
        </div>
        <div class="form-group">
          <label for="area">Área:</label>
          <select id="area" name="area">
            <%
              if (Areas != null) {
                for (Areas areas: Areas) {
            %>
            <option value="<%= areas.getClaveArea()%>"><%= areas.getNombreArea()%></option>
            <%
              }
            } else {
            %>
            <option value="">No hay areas disponibles</option>
            <%
              }
            %>
          </select>
        </div>
        <div class="form-group">
          <label for="cantidad_S">Cantidad:</label>
          <input type="number" id="cantidad_S" name="cantidad_S" oninput="updateTable(contadorFilas,folio_EG)">
        </div>
        <div class="form-group">
          <script>
            document.addEventListener('DOMContentLoaded', function() {
              function updateUnitMeasure() {
                var selectedOption = document.getElementById('claveProducto').options[document.getElementById('claveProducto').selectedIndex];
                var unidadMedida = selectedOption.getAttribute('data-unidad');
                var precio = selectedOption.getAttribute('data-precio');
                document.getElementById('unidadMedida').value = unidadMedida;
                document.getElementById('precioU').value = precio;
              }

              // Ejecutar la función al cargar la página
              updateUnitMeasure();

              // Y también cuando se cambie el select
              document.getElementById('claveProducto').addEventListener('change', updateUnitMeasure);
            });
          </script>
          <label for="unidadMedida">Unidad de Medida:</label>
          <input id="unidadMedida" name="unidadMedida" oninput="updateTable(contadorFilas,folio_EG)" readonly>
        </div>
        <div class="form-group">
          <label for="cantidad_S">Precio Unitario:</label>
          <input type="number" id="precioU" name="precioU" readonly oninput="updateTable(contadorFilas,folio_EG)">
        </div>

      </div>
    </div>
    <br>
    <!--<button type="submit">Agregar</button>-->
    <!--<a href="salidas.jsp">Registrar Salida</a>-->
    <button style="background-color: #306AFE; border-color: #306AFE" id="add-entradaa" type="button" class="btn btn-primary">Agregar salida</button>
    <button style="background-color: green; border-color: green" id="btn-backl" type="button" class="btn btn-primary" onclick="submitForm()">Registrar salida</button>


  </form>
</div>

<div class="previewEntradas" id="previewEntradas">

  <table class="table">
    <thead>
    <tr>
      <th>Folio</th>
      <th>Empleado (Recibe)</th>
      <th class="todisable2">Empleado (Envía)</th>
      <th class="todisable">Fecha</th>
      <th class="todisable"> Producto</th>
      <th class="todisable2">Área</th>
      <th class="todisable">Cantidad</th>
      <th >Unidad Medida</th>
      <th class="todisable">Precio U.</th>
      <!--<th>Total</th>-->
    </tr>
    </thead>
    <tbody id="tbody-table-preview">

    </tbody>

  </table>
</div>

<script>

  let folio_EG = null;

  function generarCodigo() {
    const numerosAleatorios = Math.floor(1000 + Math.random() * 9000);
    //let uno = 1;
    return `S-2024-`+numerosAleatorios;
  }

  let contadorFilas = 0;
  let contador = 1;
  const add_entradas = document.getElementById("add-entradaa");//-----------------------------------------------------------------------------------------------------------------------------------------
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
  add_entradas.addEventListener("click",function (){
    if(contadorGenerarCodigoNone < 1){
      folio_EG = generarCodigo();
    }
    contadorGenerarCodigoNone++;
    if(document.getElementById("previewEntradas").style.display === "block"){
        let totaLRegistro = 0;
        dataParaBD().forEach(col =>{
          console.log(col)
        })
        let stop = false;
        stop = dataInput().some(val => {
          //console.log("El valor del valor es: "+val)
          if(val == null || val === '' || val === ""){
            // alert("DEBES TERMINAR DE RESGISTRAR ESTA ENTRADA")
            $('#customAlertModal2').modal('show');
            return true; // Detiene la iteración cuando se cumple la condición
          }
          return false;
      });
      //console.log("Se detuvo: "+stop);
      if(stop === false){
        contadorFilas++;

        const tbody = document.getElementById("tbody-table-preview");
        let tr = document.createElement("tr");
        console.log("Ya debieron emezar a crearce mas de 10");
        for(let i = (contadorFilas * 9); i<(contadorFilas*9+9);i++){
          const td = document.createElement("td");
          td.id = "col" + (i + 1);
          tr.appendChild(td);
        }
        tbody.appendChild(tr);

        dataParaBD().forEach((element)=>{
          registro.push(element) ;
        });
        conjuntoRegistros.push(registro);
        registro = [];

      }
    }else{
      document.getElementById("previewEntradas").style.display = "block";
      const tbody = document.getElementById("tbody-table-preview");
      let tr = document.createElement("tr");
      for(let i = 0; i<9;i++){
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


    updateTable(contadorFilas,folio_EG);
  })
  function updateTable(cont,folio) {
    let columns = [];
    //let contadorr = 1;
    let datoImprimir;
    /*data*/
    let folio_S = document.getElementById("folio_S").value = folio_EG;
    const EmpleadoR = document.getElementById("empleado_R").value;
    const EmpleadoRR = document.getElementById("empleado_R");
    const EmpleadoRTexto = EmpleadoRR.options[EmpleadoRR.selectedIndex].text;
    const EmpleadoE = document.getElementById("empleado_E").value;
    const EmpleadoEE = document.getElementById("empleado_E");
    const EmpleadoETexto = EmpleadoEE.options[EmpleadoEE.selectedIndex].text;
    //const proveedorId = document.getElementById('nombreCompleto').value;
    //const inputP = document.getElementById('nombreCompleto');
    //const proveedor = inputP.options[inputP.selectedIndex].text;
    const fecha = document.getElementById("fecha").value;
    const inputPr = document.getElementById('claveProducto');
    const productoId = document.getElementById('claveProducto').value;
    const Producto = inputPr.options[inputPr.selectedIndex].text;
    const areaIn = document.getElementById("area");
    const areaId = document.getElementById("area").value;
    const area = areaIn.options[areaIn.selectedIndex].text;
    const cantidad = document.getElementById("cantidad_S").value;
    const umIn = document.getElementById("unidadMedida");
    const umId = document.getElementById("unidadMedida");
    /*const unidadMedida = umIn.options[umIn.selectedIndex].text;*/
    const unidadMedida = document.getElementById("unidadMedida").value;
    const precioU = document.getElementById("precioU").value;

    if(cont > 0){
      columns = [];
      for (let i = 1; i <= 9; i++) {
        console.log("col" + (contador * 9 + i))
        columns.push(document.getElementById("col" + (cont * 9 + i)));
      }

    }else{
      //console.log("ANDAN CON LOS DE 1-10");
      for (let i = 1; i <= 9; i++) {
        columns.push(document.getElementById("col"  + i));
      }
    }

    columns.forEach(column => {
      switch (column.id) {
        case columns[0].id:
          datoImprimir =folio_S;
          //console.log("col1: "+datoImprimir)
          break;
        case columns[1].id:
          datoImprimir = EmpleadoRTexto;
          // console.log("col2: "+datoImprimir)
          break;
        case columns[2].id:
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          datoImprimir = EmpleadoETexto;
          //console.log("col2: "+datoImprimir)
          break;
        case columns[3].id:
          datoImprimir = fecha;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[4].id:
          datoImprimir = Producto;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[5].id:
          datoImprimir = area;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[6].id:
          datoImprimir = cantidad;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[7].id:
          datoImprimir = unidadMedida;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[8].id:
          datoImprimir = precioU;
          //Declaraciones ejecutadas cuando el resultado de expresión coincide con el valor1
          break;
        case columns[9].id:
          datoImprimir = "";

          break;
        default:
          break;
      }
      column.innerText = datoImprimir;
    });
    //console.log("EL CONTADOR DE UPDATE TABLE: "+contadorr)
    //contadorr++;
  }

  function dataInput(){
    let folio_S = document.getElementById("folio_S").value = folio_EG;
    const EmpleadoR = document.getElementById("empleado_R").value;
    const EmpleadoE = document.getElementById("empleado_E").value;
    const fecha = document.getElementById("fecha").value;
    const inputPr = document.getElementById('claveProducto');
    const productoId = document.getElementById('claveProducto').value;
    const Producto = inputPr.options[inputPr.selectedIndex].text;
    const areaIn = document.getElementById("area");
    const areaId = document.getElementById("area").value;
    const area = areaIn.options[areaIn.selectedIndex].text;
    const cantidad = document.getElementById("cantidad_S").value;
    const umIn = document.getElementById("unidadMedida");
    const umId = document.getElementById("unidadMedida").value;
    const unidadMedida = document.getElementById("unidadMedida").value;
    const precioU = document.getElementById("precioU").value;

    const valoresInput = [
      folio_S,
      EmpleadoR,
      EmpleadoE,
      fecha,
      Producto,
      area,
      cantidad,
      unidadMedida,
      precioU];
    return valoresInput;
  }

  function dataParaBD(){
    let folio_S = document.getElementById("folio_S").value = folio_EG;
    const EmpleadoR = document.getElementById("empleado_R").value;
    const EmpleadoE = document.getElementById("empleado_E").value;
    const fecha = document.getElementById("fecha").value;
    const inputPr = document.getElementById('claveProducto');
    const productoId = document.getElementById('claveProducto').value;
    const Producto = inputPr.options[inputPr.selectedIndex].text;
    const areaIn = document.getElementById("area");
    const areaId = document.getElementById("area").value;
    const area = areaIn.options[areaIn.selectedIndex].text;
    const cantidad = document.getElementById("cantidad_S").value;
    const umIn = document.getElementById("unidadMedida");
    const umId = document.getElementById("unidadMedida").value;
    const unidadMedida = document.getElementById("unidadMedida").value;
    const precioU = document.getElementById("precioU").value;

    const valoresInputParaBD = [
      folio_S,
      EmpleadoR,
      EmpleadoE,
      fecha,
      productoId,
      umId,
      precioU,
      areaId,
      cantidad
    ]

    return valoresInputParaBD;
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
    location.reload()
  })

  function noScroll() {
    window.scrollTo(0, 0);
  }
</script>

<form id="form-reg-entrada" action="regSalidas" method="POST">
  <input type="hidden" name="data" id="data">
</form>

<script>
  function checarDataLista(){
    let folio_S = document.getElementById("folio_S").value = folio_EG;
    const EmpleadoR = document.getElementById("empleado_R").value;
    const EmpleadoE = document.getElementById("empleado_E").value;
    //const proveedorId = document.getElementById('nombreCompleto').value;
    //const inputP = document.getElementById('nombreCompleto');
    //const proveedor = inputP.options[inputP.selectedIndex].text;
    const fecha = document.getElementById("fecha").value;
    const inputPr = document.getElementById('claveProducto');
    const productoId = document.getElementById('claveProducto').value;
    const Producto = inputPr.options[inputPr.selectedIndex].text;
    const areaIn = document.getElementById("area");
    const areaId = document.getElementById("area").value;
    const area = areaIn.options[areaIn.selectedIndex].text;
    const cantidad = document.getElementById("cantidad_S").value;
    const umIn = document.getElementById("unidadMedida");
    const umId = document.getElementById("unidadMedida");
    /*const unidadMedida = umIn.options[umIn.selectedIndex].text;*/
    const unidadMedida = document.getElementById("unidadMedida");
    const precioU = document.getElementById("precioU");

    const valoresInput = [
      folio_S,
      EmpleadoR,
      EmpleadoE,
      fecha,
      Producto,
      area,
      cantidad,
      unidadMedida,
      precioU
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
    console.log("SI SE LLAMA A LA FUNCIÓN DE SALIDA ENVIAR")
    if(checarDataLista()){
      $(document).ready(function() {
        $('#customAlertModal').modal('show');
      });
      //alert("NO PUEDES REGISTRAR UNA ENTRADA INCOMPLETA");
    }else{
      dataParaBD().forEach((element)=>{
        registro.push(element) ;
      });
      conjuntoRegistros.push(registro);
      registro = [];
      //add_entradas.click();
      let arrayOfArrays = conjuntoRegistros;


      console.log("DATOS FICTICIOS")
      for(let i = 0; i<arrayOfArrays.length;i++){
        for (j=0;j<9;j++){
          console.log("Registro "+i+" Dato "+arrayOfArrays[i][j]);
        }
      }
      console.log(conjuntoRegistros);
      document.getElementById('data').value = JSON.stringify(arrayOfArrays);

      // Enviar el formulario
      document.getElementById('form-reg-entrada').submit();
    }


  }
  /*
  function submitForm() {
    console.log("SI SE LLAMA A LA FUNCIÓN DE SALIDA ENVIAR")
    if(checarDataLista()){
      $(document).ready(function() {
        $('#customAlertModal').modal('show');
      });
      //alert("NO PUEDES REGISTRAR UNA ENTRADA INCOMPLETA");
    }else{
      add_entradas.click();
      let arrayOfArrays = conjuntoRegistros;

      console.log("DATOS FICTICIOS")
      for(let i = 0; i<arrayOfArrays.length;i++){
        for (j=0;j<2;j++){
          console.log("Registro "+i+" Dato "+j);
        }
      }

      // Convertir el arreglo de arreglos a JSON
      document.getElementById('data').value = JSON.stringify(arrayOfArrays);

      // Enviar el formulario
      document.getElementById('form-reg-entrada').submit();
    }


  }*/
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
    }x
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