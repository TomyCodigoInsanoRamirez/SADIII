<!DOCTYPE html>
<html>
<head>
    <title>SADI</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <link rel='stylesheet' type='text/css' media='screen' href='css/home.css'>



    <style>
        .container {
            display: flex;
        }
        .sidebar {
            width: 200px;
            background-color: #f4f4f4;
            padding: 20px;
        }
        .logo {
            display: flex;
            align-items: center;
        }
        .logo img {
            width: 40px;
            margin-right: 10px;
        }
        .menu {
            margin-top: 20px;
        }
        .menu-item {
            cursor: pointer;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .dropdown-content {
            display: none;
            flex-direction: column;
            padding-left: 15px;
        }
        .dropdown-content a {
            padding: 5px 0;
            text-decoration: none;
            color: #000;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .table-container {
            overflow-x: auto;
        }
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
        }
    </style>
</head>
<body>

<div class="container">

    <div class="sidebar">
        <div class="logo">
            <img src="img/logo.png" alt="SADI">
            <span>SADI</span>
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
                <img src="img/logo.png" alt="SADI">
                <span>SADI</span>
            </div>
            <div class="right">
                <img src="img/profile.png" alt="Perfil">
                <input type="text" placeholder="Buscar">
            </div>
        </div>
        <div class="table-container">
            <div class="table-header">
                <input type="text" placeholder="Buscar">
            </div>
            <table>
                <thead>
                <tr>
                    <th>ID_Usuario</th>
                    <th>Nombre</th>
                    <th>Correo</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Enrique Landa</td>
                    <td><a href="mailto:20235tn174@utez.edu.mx">20235tn174@utez.edu.mx</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Tomas Bartolo</td>
                    <td><a href="mailto:20235tn172@utez.edu.mx">20235tn172@utez.edu.mx</a></td>
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
