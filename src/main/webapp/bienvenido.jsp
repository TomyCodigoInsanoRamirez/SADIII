<%--
  Created by IntelliJ IDEA.
  User: Tomy
  Date: 21/06/2024
  Time: 09:47 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>

    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Inventario SADI</title>

    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">
        <img src="path_to_your_logo_image.png" alt="SADI Logo" class="img-fluid" style="max-width: 40px;">
        SADI
    </a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="glyphicon glyphicon-user"></span> Perfil</a>
            </li>
        </ul>
    </div>
    <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Buscar por nombre" aria-label="Search">
        <button class="btn btn-outline-secondary my-2 my-sm-0" type="submit">🔍</button>
    </form>
    <button class="btn btn-outline-dark my-2 my-sm-0 ml-2" type="button">🔄</button>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-12 mb-3">
            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                <label class="btn btn-primary active">
                    <input type="radio" name="options" id="option1" checked> Inventario
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="options" id="option2"> Productos
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="options" id="option3"> Proveedores
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="options" id="option4"> Historial
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="options" id="option5"> Reportes
                </label>
                <label class="btn btn-secondary">
                    <input type="radio" name="options" id="option6"> Areas
                </label>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12">
            <table class="table table-bordered">
                <thead class="thead-light">
                <tr>
                    <th>ID_Producto</th>
                    <th>Nombre del Producto</th>
                    <th>Descripción</th>
                    <th>Categoría</th>
                    <th>Cantidad en Stock</th>
                    <th>Precio Unitario</th>
                    <th>Fecha de Entrada</th>
                    <th>Acciones</th>
                    <th>Activo/Inactivo</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Producto 1</td>
                    <td>Descripción 1</td>
                    <td>Categoría 1</td>
                    <td>10</td>
                    <td>$100</td>
                    <td>2023-06-21</td>
                    <td>
                        <button class="btn btn-warning btn-sm">Modificar</button>
                        <button class="btn btn-danger btn-sm">Eliminar</button>
                    </td>
                    <td>
                        <div class="custom-control custom-switch">
                            <input type="checkbox" class="custom-control-input" id="customSwitch1" checked>
                            <label class="custom-control-label" for="customSwitch1"></label>
                        </div>
                    </td>
                </tr>
                <!-- Repite las filas según sea necesario -->
                </tbody>
            </table>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
