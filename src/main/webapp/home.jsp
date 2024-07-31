
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>

<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="java.util.ArrayList" %>
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
            <h2>¿DESACTIVAR USUARIO? </h2>
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
            <h2>¿ACTIVAR USUARIO? </h2>
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
                    <h1>USUARIOS</h1>
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
                        <div style="position: relative; display: block" >

                            <table class="table table-hover tab">
                                <thead>
                                <tr>
                                    <th class="todisable2">ID_Usuario</th>
                                    <th>Nombre</th>
                                    <th class="todisable">Correo</th>
                                    <th>Acciones</th>
                                    <th></th>
                                </tr>
                                </thead>
                                <tbody id="tabla-body">
                                <%
                                    UserDao dao = new UserDao();
                                    ArrayList<Usuario> lista = dao.getAll();
                                    for(Usuario u : lista){ %>
                                <tr>
                                    <td class="todisable2"><%=u.getId()%></td>
                                    <td><%=u.getNombre1_U()%></td>
                                    <td class="todisable"><%=u.getCorreo()%></td>
                                    <td id="acc" class="acc">
                                           <a href="#" class="acc" data-toggle="modalv" data-target="#editModal<%= u.getId() %>">
                                            <img class="act" src="img/visibility_24dp.png"  >
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <a href="#" class="acc" data-toggle="modal" data-target="#editModal<%= u.getId() %>">
                                            <img class="act" src="img/iconolapiz-removebg-preview.png" alt="Editar" style="width: 24px; height: 24px;">
                                        </a>
                                    </td>
                                    <td class="acc">
                                        <label class="switch small">
                                            <a href="updateUsuarioE?id=<%=u.getId()%>&estado=<%=u.isEstado()%>" class="delete-link" style="display: none;">Eliminar</a>
                                            <input type="checkbox" class="inn" data-estado="<%=u.isEstado()%>" onclick="checar(this);">
                                            <span class="slider"></span>
                                            <%
                                                if(u.isEstado() == 1){
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
                                <div class="modal fade" id="editModal<%= u.getId() %>" tabindex="-1" role="dialog" aria-labelledby="editModalLabel<%= u.getId() %>" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="editModalLabel<%= u.getId() %>">Editar Información del Área</h5>
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>
                                            <div class="modal-body">
                                                <form id="editForm<%= u.getId() %>" action="ActualizarUsuarioServlet" method="post">
                                                    <input type="hidden" name="id" value="<%= u.getId() %>">

                                                    <div class="form-group">
                                                        <label for="nombreArea<%= u.getId() %>">Nombre 1:</label>
                                                        <input type="text" class="form-control" id="nombreArea<%= u.getId() %>" name="nombre1_U" value="<%= u.getNombre1_U() %>" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="nombreArea<%= u.getId() %>">Nombre 2:</label>
                                                        <input type="text" class="form-control" id="nombreArea<%= u.getId() %>" name="nombre2_U" value="<%= u.getNombre2_U() %>" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="nombreArea<%= u.getId() %>">Apellido 1:</label>
                                                        <input type="text" class="form-control" id="nombreArea<%= u.getId() %>" name="apellido1_U" value="<%= u.getApellido1_U() %>" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label for="nombreArea<%= u.getId() %>">Apellido 2:</label>
                                                        <input type="text" class="form-control" id="nombreArea<%= u.getId() %>" name="apellido2_U" value="<%= u.getApellido2_U() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="descripcionArea<%= u.getId() %>">Correo:</label>
                                                        <input type="text" class="form-control" id="descripcionArea<%= u.getId() %>" name="correo" value="<%= u.getCorreo() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="descripcionArea<%= u.getId() %>">Telefono:</label>
                                                        <input type="text" class="form-control" id="descripcionArea<%= u.getId() %>" name="telefono" value="<%= u.getTelefono() %>" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="descripcionArea<%= u.getId() %>">Rol:</label>
                                                        <input type="text" class="form-control" id="descripcionArea<%= u.getId() %>" name="rol" value="<%= u.getRol() %>" required>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-primary" form="editForm<%= u.getId() %>">Guardar Cambios</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- modal solo para mostrar info-->

                                <%} %>
                                </tbody>
                            </table>

                            <!-- Modal para editar usuario -->
                            <div id="editUserModal" class="modal">
                                <div class="modal-content">
                                    <span class="close" onclick="closeModal()">&times;</span>
                                    <h2>Editar Usuario</h2>
                                    <form id="editUserForm" action="ActualizarUsuarioServlet" method="post">
                                        <input type="hidden" id="editUserId" name="id">
                                        <div>
                                            <label for="editUserCorreo">Correo:</label>
                                            <input type="email" id="editUserCorreo" name="correo" required>
                                        </div>
                                        <div>
                                            <label for="editUserNombre1">Primer Nombre:</label>
                                            <input type="text" id="editUserNombre1" name="nombre1_U" required>
                                        </div>
                                        <div>
                                            <label for="editUserApellido1">Primer Apellido:</label>
                                            <input type="text" id="editUserApellido1" name="apellido1_U" required>
                                        </div>
                                        <div>
                                            <label for="editUserNombre2">Segundo Nombre:</label>
                                            <input type="text" id="editUserNombre2" name="nombre2_U">
                                        </div>
                                        <div>
                                            <label for="editUserApellido2">Segundo Apellido:</label>
                                            <input type="text" id="editUserApellido2" name="apellido2_U">
                                        </div>
                                        <div>
                                            <label for="editUserTelefono">Teléfono:</label>
                                            <input type="text" id="editUserTelefono" name="telefono" required>
                                        </div>
                                        <div>
                                            <label for="editUserContrasena">Contraseña:</label>
                                            <input type="password" id="editUserContrasena" name="contrasena" required>
                                        </div>
                                        <div>
                                            <label for="editUserEstado">Estado:</label>
                                            <input type="number" id="editUserEstado" name="estado" required>
                                        </div>
                                        <div>
                                            <label for="editUserCodigo">Código:</label>
                                            <input type="text" id="editUserCodigo" name="codigo" required>
                                        </div>
                                        <div>
                                            <label for="editUserRol">Rol:</label>
                                            <input type="text" id="editUserRol" name="rol" required>
                                        </div>
                                        <!--<button type="submit">Guardar Cambios</button>-->
                                        <input type="submit" value="enviar">
                                    </form>
                                </div>
                            </div>



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
</div><!-- formulario de registro (add) -->
<div class="popup-container" id="popup-container">
    <div class="popup-header">
        <h2>Registro de Productos</h2>
        <button class="close-btn" id="close">✖</button>
    </div>
    <form action="usuario" method="post">
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
    // Abrir el modal para editar usuario
    function openEditModal(id, correo, nombre) {
        document.getElementById('editUserId').value = id;
        document.getElementById('editUserCorreo').value = correo;
        document.getElementById('editUserNombre').value = nombre;
        document.getElementById('editUserModal').style.display = 'block';
    }

    // Cerrar el modal
    document.querySelector('.modal .close').onclick = function() {
        document.getElementById('editUserModal').style.display = 'none';
    };

    // Cerrar el modal cuando el usuario haga clic fuera de él
    window.onclick = function(event) {
        if (event.target == document.getElementById('editUserModal')) {
            document.getElementById('editUserModal').style.display = 'none';
        }
    };
</script>
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
    // JavaScript para manejar el formulario emergente y el scroll
    document.getElementById("agregar-fila").addEventListener("click", function () {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        pop.style.display = "block";
        capa.style.display = "block";
        document.body.style.overflow = "hidden"; // Evita el scroll de la página principal
    });

    document.getElementById("close").addEventListener("click", function () {
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        pop.style.display = "none";
        capa.style.display = "none";
        document.body.style.overflow = "auto"; // Restaura el scroll de la página principal
    });

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