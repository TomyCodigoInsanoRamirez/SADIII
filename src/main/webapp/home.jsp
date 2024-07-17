<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SADI</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        .bg-coffee {
            background-color: #60503e;
        }
        #sidebar-accordion .list-group-item {
            background-color: #60503e;
            color: #ecf0f1;
        }

        #sidebar-accordion .list-group-item:hover {
            background-color: #7b6946;
            color: #ecf0f1;
        }

        #sidebar-accordion .list-group-item:active,
        #sidebar-accordion .list-group-item.active {
            background-color: #a2875f;
            color: white;
        }
    </style>
</head>

<body>
<div class="d-flex">
    <div id="sidebar">
        <div id="sidebar-accordion" class="accordion" style="width: 200px;">
            <div class="list-group">
                <a href="#dashboard-items" data-toggle="collapse" aria-expanded="false"
                   class="list-group-item list-group-item-action text-light">
                    <i class="bi bi-collection-fill mr-3"aria-hidden="true"></i>Catalogos
                </a>
                <div id="dashboard-items" class="collapse" data-parent="#sidebar-accordion">
                    <a href="home.jsp" class="list-group-item list-group-item-action bg-coffe text-ligth e pl-5">
                        <i class="bi bi-people-fill mr-3"aria-hidden="true"></i>
                        Usuarios
                    </a>
                    <a href="productos.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-basket2-fill mr-3"aria-hidden="true"></i>
                        Productos
                    </a>
                    <a href="provedores.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-people-fill mr-3"aria-hidden="true"></i>
                        Proveedores
                    </a>
                    <a href="areas.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-layers-fill mr-3"aria-hidden="true"></i>
                        Áreas
                    </a>
                    <a href="unidadMedida.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-thermometer-low mr-3"aria-hidden="true"></i>
                        Unidades de Medida
                    </a>
                </div>
                <a href="#setting-items" data-toggle="collapse" aria-expanded="false"
                   class="list-group-item list-group-item-action bg-coffee text-light">
                    <i class="fa fa-cog mr-3" aria-hidden="true"></i>Acciones
                </a>
                <div id="setting-items" class="collapse" data-parent="#sidebar-accordion">
                    <div class="bg-coffee text-light text-center bg-coffee">Registro</div>
                    <div class="d-flex flex-row text-center">
                        <a href="registrarEntrada.jsp" class="list-group-item list-group-item-action bg-coffee text-light">
                            <i class="bi bi-arrow-left-square-fill mr-3"aria-hidden="true"></i>
                            Entrada
                        </a>
                        <a href="registrarSalidas.jsp" class="list-group-item list-group-item-action bg-coffee text-light">
                            <i class="bi bi-arrow-right-square-fill mr-3"aria-hidden="true"></i>
                            Salida
                        </a>
                    </div>
                </div>
                <a href="#profile-items" data-toggle="collapse" aria-expanded="false"
                   class="list-group-item list-group-item-action bg-coffee text-light">
                    <i class="bi bi-clipboard2 mr-3" aria-hidden="true"></i>Reportes
                </a>
                <div id="profile-items" class="collapse" data-parent="#sidebar-accordion">
                    <a href="entradas.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-clipboard-data-fill mr-3"aria-hidden="true"></i>
                        Entrada
                    </a>
                    <a href="salidas.jsp" class="list-group-item list-group-item-action bg-coffee text-light pl-5">
                        <i class="bi bi-clipboard-check-fill mr-3"aria-hidden="true"></i>
                        Salida
                    </a>
                </div>
            </div>
        </div>
    </div>
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark bg-coffee">
            <div class="container-xl">
                <a class="navbar-brand" href="home.jsp">
                    <img src="img/logo3.png" alt="SADI" width="140" height="50">
                </a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample07XL" aria-controls="navbarsExample07XL" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample07XL">
                    <ul class="navbar-nav mr-auto">
                    </ul>
                    <form class="form-inline my-2 my-md-0">
                        <input class="form-control" type="text" placeholder="Search" aria-label="Search">
                        <a href="Profile.jsp" style="margin:10px">
                            <i class="bi bi-person-fill" style="font-size: 2rem; color: rgb(255, 255, 255);"></i>
                        </a>
                    </form>
                </div>
            </div>
        </nav>
        <section class="p-3">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>ID_Usuario</th>
                                <th>Nombre</th>
                                <th>Correo</th>
                                <th>Acciones</th>
                                <th>
                                    <button id="agregar-fila" class="btn btn-primary btn-circular"><i
                                            class="bi bi-person-fill-add"
                                            style="font-size: 1.3rem; color: rgb(255, 255, 255);"></i></button>
                                </th>
                            </tr>
                            </thead>
                            <tbody id="tabla-body">

                            <tr>
                                <td>1</td>
                                <td>Enrique Land</td>
                                <td><a href="mailto:20235tn174@utez.edu.mx">20235tn174@utez.edu.mx</a></td>
                                <td class="acciones">
                                    <a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill"
                                                                                    style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                                    <a href="editar.jsp" style="margin:10px"><i class="bi bi-pencil-square"
                                                                                style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>

                                    <template>
                                        <div>
                                            <b-form-checkbox v-model="checked" name="check-button" switch>
                                                Switch Checkbox <b>(Checked: {{ checked }})</b>
                                            </b-form-checkbox>
                                        </div>
                                    </template>

                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Tomas Bartolo</td>
                                <td><a href="mailto:20235tn172@utez.edu.mx">20235tn172@utez.edu.mx</a></td>
                                <td class="acciones">
                                    <img src="img/visibility_24dp.png" width="30px">
                                    <img src="img/iconolapiz-removebg-preview.png" width="30px">
                                    <label class="switch">
                                        <input type="checkbox" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                        <span class="slider"></span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>

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

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
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