<!DOCTYPE html>
<html>
<head>
    <title>SADI</title>
    <!--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">-->
    <meta charset="UTF-8">
    <link rel='stylesheet' type='text/css' media='screen' href='css/home.css'>
</head>
<body>

<div class="container">

    <div class="sidebar">
        <div class="logo">
            <img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="200px">
        </div>
        <div class="menu">
            <div class="menu-item" onclick="toggleDropdown('catalogos')">Catálogos<i class="fas fa-chevron-down"></i></div>
            <div id="catalogos" class="dropdown-content">
                <a href="productos.jsp">Productos</a>
                <a href="provedores.jsp">Proveedores</a>
                <a href="areas.jsp">Áreas</a>
            </div>
            <div class="menu-item" onclick="toggleDropdown('acciones')">Acciones<i class="fas fa-chevron-down"></i></div>
            <div id="acciones" class="dropdown-content">
                <a href="#">Registrar producto</a>
                <a href="#">Editar producto</a>
                <a href="#">Cambiar estado del producto</a>
                <a href="#">Visualizar producto</a>
            </div>
            <div class="menu-item" onclick="toggleDropdown('reportes')">Reportes<i class="fas fa-chevron-down"></i></div>
            <div id="reportes" class="dropdown-content">
                <a href="#">Entrada</a>
                <a href="#">Salida</a>
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
                <div class="add"><a href=""><img src="img/add-removebg-preview.png" width="80px"></a></div>
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
                <tr>
                    <td>PEGJ900415X8Z</td>
                    <td>Oficinas y Suministros S.A. de C.V.</td>
                    <td>Enrique Landa Hernandez</td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px"> <img src="img/visibility_24dp.png" width="30px"> </td>
                </tr>
                <tr>
                    <td>LTGJ930415X8Z</td>
                    <td>Materiales de papelería S.A. de C.V.</td>
                    <td>Tomas Bartolo Bartolo</td>
                    <td class="acciones"><label class="switch"> <input type="checkbox"> <span class="slider"></span> </label>  <img src="img/iconolapiz-removebg-preview.png" width="30px"> <img src="img/visibility_24dp.png" width="30px"> </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
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

