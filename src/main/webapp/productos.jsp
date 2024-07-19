<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SADI</title>
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">-->
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
                <div class="add" id="add" ><a href=""><img src="img/add-removebg-preview.png" width="80px"></a></div>
            </div>
            <table>
                <thead>
                <tr>
                    <th>Clave</th>
                    <th>Nombre</th>
                    <th>Descripción</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>P-0001</td>
                    <td>Boligrafo Azul</td>
                    <td><p>Bolígrafo azul de punta fina, de tinta azul, con una punta de 0.5 mm de grosor.</p></td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px">  </td>
                </tr>
                <tr>
                    <td>P-0002</td>
                    <td>Lápiz A2</td>
                    <td><p>Lorem es simplemente el texto de relleno de las imprentas y archivos de texto. </p></td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px">  </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<!-- -->
<div id="popup-container" class="popup-container">
    <div class="popup-header">
        <h2>Registro de Productos</h2>
        <button id="close" class="close-btn" >✖</button>
    </div>
    <form action="registroProducto" method="post">
        <div class="form-group">
            <label for="product-key">CLAVE:</label>
            <input type="text" id="product-key" name="product-key" placeholder="EJEMPLO:">
        </div>
        <div class="form-group">
            <label for="product-name">NOMBRE:</label>
            <input type="text" id="product-name" name="product-name" placeholder="EJEMPLO:">
        </div>
        <div class="form-group">
            <label for="description">DESCRIPCIÓN:</label>
            <textarea id="description" name="description" placeholder="EJEMPLO:"></textarea>
        </div>
        <button type="submit" class="add-btn">Agregar</button>
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

