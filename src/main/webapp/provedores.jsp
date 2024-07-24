<%@ page import="mx.edu.utez.saditarea.modelo.Proveedores" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>SADI</title>
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">-->
    <meta charset="UTF-8">
    <link rel='stylesheet' type='text/css' media='screen' href='css/home.css'>
</head>
<body>
<div id="capa-obscurecer"></div>
<div class="container">

    <div class="sidebar">
        <div class="logo">
            <img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="200px">
        </div>
        <div class="menu">
            <div class="menu-item" onclick="toggleDropdown('catalogos')">Catálogos<i class="fas fa-chevron-down"></i></div>
            <div id="catalogos" class="dropdown-content">
                <a href="home.jsp">Usuarios</a>
                <a href="productos.jsp">Productos</a>
                <a href="provedores.jsp">Proveedores</a>
                <a href="areas.jsp">Áreas</a>
                <a href="unidadMedida.jsp">Unidades de medida</a>
            </div>
            <div class="menu-item" onclick="toggleDropdown('acciones')">Acciones<i class="fas fa-chevron-down"></i></div>
            <div id="acciones" class="dropdown-content">
                <a href="registrarEntrada.jsp">Registrar Entrada</a>
                <a href="registrarSalidas.jsp">Registrar Salida</a>
            </div>
            <div class="menu-item" onclick="toggleDropdown('reportes')">Reportes<i class="fas fa-chevron-down"></i></div>
            <div id="reportes" class="dropdown-content">
                <a href="entradas.jsp">Entrada</a>
                <a href="salidas.jsp">Salida</a>
            </div>
        </div>
    </div>

    <div class="main-content">
        <div class="header">
            <div class="left">
            </div>
            <div class="right">
                <a href=""><img src="img/LOGINsINfONDO-removebg-preview.png" alt="Perfil" width="80px"></a>
            </div>
        </div>
        <div class="barra-busqueda">
            <div class="izquierda">

            </div>
            <div class="derecha">
                <input type="text" placeholder="Buscar" >
                <span><img src="img/LUPAsINfONDO-removebg-preview.png" width="20px"></span>
            </div>
        </div>
        <div class="table-container">
            <div class="espacioBlancoTabla">
                <div class="add" id="add"><a href=""><img src="img/add-removebg-preview.png" width="80px"></a></div>
            </div>
            <table>
                <thead>
                <tr>
                    <th>RFC</th>
                    <th>Razón Social</th>
                    <th>Nombre</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<Proveedores> proveedores = (List<Proveedores>) request.getAttribute("proveedores");
                    if (proveedores != null && !proveedores.isEmpty()) {
                        for (Proveedores proveedor : proveedores) {
                            String nombreCompleto = String.format("%s %s %s %s", proveedor.getNombre1_P(), proveedor.getNombre2_P(), proveedor.getApellido1_P(), proveedor.getApellido2_P());
                %>
                <tr>
                    <td><%= proveedor.getRFC() %></td>
                    <td><%= proveedor.getRazon_social() %></td>
                    <td><%= nombreCompleto %></td>
                    <td class="acciones">
                        <label class="switch">
                            <input type="checkbox">
                            <span class="slider"></span>
                        </label>
                        <span class="iconos">
                        <img src="img/iconolapiz-removebg-preview.png" width="30px" alt="Editar">
                        <img src="img/visibility_24dp.png" width="30px" alt="Ver">
                    </span>
                    </td>
                </tr>
                <%
                    }
                } else {
                %>
                <tr>
                    <td colspan="4">No se encontraron proveedores.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!--sdasdasdsa-->
<div class="popup-container" id="popup-container">
    <div class="popup-header">
        <h2>Registro de Productos</h2>
        <button  class="close-btn" id="close">✖</button>
    </div>
    <form action="registroProveedor" method="post">
    <div class="contenedorInputs">
        <div class="izquierda">
            <div class="form-group">
                <label for="rfc">RFC:</label>
                <input type="text" id="rfc" name="rfc" required>
            </div>
            <div class="form-group">
                <label for="nombre1">Nombre:</label>
                <input type="text" id="nombre1" name="nombre1" required>
            </div>
            <div class="form-group">
                <label for="nombre2">Segundo nombre:</label>
                <input type="text" id="nombre2" name="nombre2" placeholder="Opcional">
            </div>
            <div class="form-group">
                <label for="apellido1">Apellido Paterno:</label>
                <input type="text" id="apellido1" name="apellido1" required>
            </div>
            <div class="form-group">
                <label for="apellido2">Apellido Materno:</label>
                <input type="text" id="apellido2" name="apellido2">
            </div>
            <div class="form-group">
                <label for="telefono">Número de teléfono:</label>
                <input type="text" id="telefono" name="telefono" required>
            </div>
            <div class="form-group">
                <label for="nombre1A">Nombre (Contacto Adicional):</label>
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
                <label for="telefonoA">Número de teléfono (Contacto Adicional):</label>
                <input type="text" id="telefonoA" name="telefonoA">
            </div>
            <div class="form-group">
                <label for="razonSocial">Razón Social:</label>
                <input type="text" id="razonSocial" name="razonSocial" required>
            </div>
            <div class="form-group">
                <label for="cp">Código postal:</label>
                <input type="text" id="cp" name="cp" required>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección:</label>
                <input type="text" id="direccion" name="direccion" required>
            </div>
        </div>
    </div>
    <button id="btn-enviar" type="submit" class="add-btn">Agregar</button>
</form>
</div>
<script>
    document.getElementById("add").addEventListener("click",function (event){
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        if(pop.style.display === "none"){
            pop.style.display = "block";
            capa.style.zIndex = 1;
            pop.style.zIndex = 2;
            capa.style.backgroundColor = "rgba(0,0,0,0.7)";
        }else{
            pop.style.display = "none";
        }
        event.preventDefault();
    })
    document.getElementById("close").addEventListener("click",function (event){
        let pop = document.getElementById("popup-container");
        let capa = document.getElementById("capa-obscurecer");
        if(pop.style.display === "none"){
            pop.style.display = "block";
        }else{
            capa.style.zIndex = -1;
            pop.style.display = "none";
        }
        event.preventDefault();
    })
    function toggleDropdown(id) {
        var dropdown = document.getElementById(id);
        if (dropdown.style.display === "block") {
            dropdown.style.display = "none";
        } else {
            dropdown.style.display = "block";
        }
    }


</script>

</body>
</html>

