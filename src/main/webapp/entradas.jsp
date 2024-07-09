<%--
  Created by IntelliJ IDEA.
  User: Tomy
  Date: 06/07/2024
  Time: 06:43 p. m.
  To change this template use File | Settings | File Templates.
--%>
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
                    <th>Folio</th>
                    <th>Razón Social</th>
                    <th>Producto</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>E-2024-0001</td>
                    <td>Oficinas y Suministros S.A. de C.V.</td>
                    <td>Boligrafo</td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px"> <img src="img/visibility_24dp.png" width="30px"> </td>
                </tr>
                <tr>
                    <td>E-2024-0002</td>
                    <td>Materiales de papelería S.A. de C.V.</td>
                    <td>Papel</td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px"> <img src="img/visibility_24dp.png" width="30px"> </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="popup-container" id="popup-container">
    <div class="popup-header">
        <h2>Registro de Entradas</h2>
        <button  class="close-btn" id="close">✖</button>
    </div>
    <form>
        <!-- <button id="close" class="close-btn" >✖</button> -->
        <div class="contenedorInputs">
            <div class="izquierda">
                <div class="form-group">
                    <label for="billing-number">Número de facturación:</label>
                    <input type="text" id="billing-number" name="billing-number">
                </div>
                <div class="form-group">
                    <label for="provider-name">Nombre del proveedor:</label>
                    <select id="provider-name" name="provider-name">
                        <option value="Proveedor 1" title="RFC123456">Proveedor 1</option>
                        <option value="Proveedor 2" title="RFC654321">Proveedor 2</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="entry-date">Fecha de entrada:</label>
                    <input type="date" id="entry-date" name="entry-date">
                </div>
                <div class="form-group">
                    <label for="receiver-name">Nombre completo (almacenista receptor):</label>
                    <select id="receiver-name" name="receiver-name">
                        <option value="Almacenista 1" title="RFC789012">Almacenista 1</option>
                        <option value="Almacenista 2" title="RFC210987">Almacenista 2</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="product">Producto:</label>
                    <select id="product" name="product">
                        <option value="Producto 1">Producto 1</option>
                        <option value="Producto 2">Producto 2</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select>
                </div>
            </div>
            <div class="derecha">
                <div class="form-group">
                    <label for="unit">Unidad de medida:</label>
                    <select id="unit" name="unit">
                        <option value="Unidad 1">Unidad 1</option>
                        <option value="Unidad 2">Unidad 2</option>
                        <!-- Agrega más opciones según sea necesario -->
                    </select>
                </div>
                <div class="form-group">
                    <label for="quantity">Cantidad:</label>
                    <input type="number" id="quantity" name="quantity">
                </div>
                <div class="form-group">
                    <label for="unit-price">Precio unitario:</label>
                    <input type="number" id="unit-price" name="unit-price">
                </div>
                <div class="form-group">
                    <label for="total-price">Precio total de productos:</label>
                    <input type="number" id="total-price" name="total-price" readonly>
                </div>
            </div>
        </div>
        <button id="btn-enviarr" type="submit" class="add-btn">Agregar</button>
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
