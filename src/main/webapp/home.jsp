<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>SADI</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>

<body>
<nav class="navbar bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">
            <img src="img/logo1.png" alt="SADI" width="150" height="50">
        </a>
        <form class="form-inline" role="search" style="margin-left: auto !important;">
            <input class="form-control mr-2" type="search" placeholder="Buscar" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">
                <span><i class="bi bi-search"></i></span>
            </button>
            <div>
                <a href="Profile.jsp" style="margin:10px"><i class="bi bi-person-fill"  style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
            </div>
        </form>
    </div>
</nav>
<div id="capa-obscurecer"></div>
<div class="container-fluid" >
    <div class="row" >
        <div class="col-md-2 bg-light sidebar">
            <nav class="nav flex-column">
                <div class="menu-item" id="toggleCatalogos"><i class="bi bi-collection-fill" style="font-size: 1.2rem; color: rgb(48, 35, 27);"></i> Catálogos<i class="fas fa-chevron-down ml-2"
                                                                                                                                                                 style="font-synthesis-style: auto"></i></div>
                <div id="catalogos" class="dropdown-content pl-3" style="font-size: 2rm,  grid; place-items: center; height: auto; border-radius: 30px; border: 4px solid #623320;">
                    <a class="nav-link" href="home.jsp">Usuarios</a>
                    <a class="nav-link" href="productos.jsp">Productos</a>
                    <a class="nav-link" href="provedores.jsp">Proveedores</a>
                    <a class="nav-link" href="areas.jsp">Áreas</a>
                    <a class="nav-link" href="unidadMedida.jsp">Unidades de medida</a>
                </div>
                <div class="menu-item" id="toggleAcciones"><i class="bi bi-layers-half"  ></i> Acciones <i class="fas fa-chevron-down ml-2"></i></div>
                <div id="acciones" class="dropdown-content pl-3" style="display: grid; place-items: center; height: auto; border-radius: 30px; border: 4px solid #623320;">
                    <a class="nav-link" href="registrarEntrada.jsp">Registrar Entrada</a>
                    <a class="nav-link" href="registrarSalidas.jsp">Registrar Salida</a>
                </div>
                <div class="menu-item" id="toggleReportes"><i class="bi bi-clipboard2"></i> Reportes <i class="fas fa-chevron-down ml-2"></i></div>
                <div id="reportes" class="dropdown-content pl-3" style="display: grid; place-items: center; height: auto; border-radius: 30px; border: 4px solid #623320;">
                    <a class="nav-link" href="entradas.jsp">Entrada</a>
                    <a class="nav-link" href="salidas.jsp">Salida</a>
                </div>
            </nav>
        </div>

        <div class="col-md-10 main-content">
            <div class="table-container mt-5">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>ID_Usuario</th>
                        <th>Nombre</th>
                        <th>Correo</th>
                        <th>Acciones</th>
                        <th>
                            <button id="agregar-fila" class="btn btn-primary btn-circular"><i class="bi bi-person-fill-add"  style="font-size: 1.3rem; color: rgb(48, 35, 27);"></i></button>
                        </th>
                    </tr>

                    </thead>
                    <tbody id="tabla-body">

                    <tr>
                        <td>1</td>
                        <td>Enrique Landa</td>
                        <td><a href="mailto:20235tn174@utez.edu.mx">20235tn174@utez.edu.mx</a></td>
                        <td class="acciones">
                            <a href="visualizar.jsp" style="margin:10px"><i class="bi bi-eye-fill"  style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>
                            <a href="editar.jsp" style="margin:10px"><i class="bi bi-pencil-square"  style="font-size: 2rem; color: rgb(77, 53, 42);"></i></a>

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
                <nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link">Previous</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
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

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        $('#toggleCatalogos').click(function () {
            $('#catalogos').slideToggle(500);
        });
        $('#toggleAcciones').click(function () {
            $('#acciones').slideToggle(500);
        });
        $('#toggleReportes').click(function () {
            $('#reportes').slideToggle(500);
        });

        $('#agregar-fila').click(function () {
            var nuevaFila = '<tr><td>Nuevo ID</td><td>Nuevo Nombre</td><td>nuevo.email@example.com</td><td class="acciones"><img src="img/visibility_24dp.png" width="30px"><img src="img/iconolapiz-removebg-preview.png" width="30px"><label class="switch"><input type="checkbox" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="slider"></span></label></td></tr>';
            $('#tabla-body').append(nuevaFila);
        });

        // Activar el modal de desactivación de usuario
        $('.acciones input[type="checkbox"]').change(function () {
            if (this.checked) {
                $('#exampleModal').modal('show');
            }
        });
    });
</script>


</body>

</html>