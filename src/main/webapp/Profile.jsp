<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
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
    <link rel="icon" href="img/apple-touch-icon.png" type="image/png">

</head>
<body>
<div id="capa-obscurecer"></div>
<div class="d-flex">
    <div class="content w-100">
        <nav class="navbar navbar-expand-lg navbar-dark">
            <a class="navbar-brand" href="home.jsp">
                <img src="img/logoSadiSIN_FONDO-removebg-preview.png" alt="SADI" width="150px">
            </a>
            <div class="tituloSeccion">
                <h1></h1>
            </div>
            <div class="log">
                <a href="Profile.jsp"><img src="img/LOGINsINfONDO-removebg-preview.png" width="70px"></a>
            </div>
        </nav>
        <%
            UserDao dao = new UserDao();
            ArrayList<Usuario> lista = dao.getAll();
            Usuario u = null;
            if (!lista.isEmpty()) {
                u = lista.get(0); // Mostrar solo el primer usuario como ejemplo
        %>
        <section class="vh-100">
            <div class="container py-5 ">
                <div class="row d-flex justify-content-center align-items-center ">
                    <div class="col-md-12 col-xl-4">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-body text-center">
                                <div class="mt-3 mb-4">
                                    <img src="img/LOGINsINfONDO-removebg-preview.png"
                                         class="rounded-circle img-fluid" style="width: 100px;" />
                                </div>
                                <h4 class="mb-2"><%= u.getNombre1_U() %> <%= u.getNombre2_U() %> <%= u.getApellido1_U() %> <%= u.getApellido2_U() %></h4>

                                <p class="text-muted mb-4">Teléfono: <span class="mx-2">|</span> <%= u.getTelefono() %></p>

                                <p class="text-muted mb-4">Correo: <span class="mx-2">|</span><%= u.getCorreo() %></p>

                                <p class="text-muted mb-4">Contraseña: <span class="mx-2">|</span>
                                        ********</p>

                                <div class="profile-buttons mt-3">
                                    <a href="logout.jsp" class="btn btn-danger">Cerrar Sesión</a>
                                    <a href="#" class="btn btn-primary ml-2" data-toggle="modal" data-target="#editProfileModal">Editar Información</a>
                                </div>

                            </div>
                            <%
                            } else {
                            %>
                            <p>No se encontraron usuarios.</p>
                            <%
                                }
                            %>
                        </div>

                    </div>
                </div>
            </div>
        </section>


    </div>
</div>

<!-- Modal para Editar Información -->
<div class="modal fade" id="editProfileModal" tabindex="-1" role="dialog" aria-labelledby="editProfileModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editProfileModalLabel">Editar Información del Perfil</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%
                    if (u != null) {
                %>
                <form id="editProfileForm" action="actualizarInformacion.jsp" method="post">
                    <input type="hidden" name="userId" value="<%= u.getId() %>">
                    <div class="form-group">
                        <label for="nombre1_U">Nombre 1:</label>
                        <input type="text" class="form-control" id="nombre1_U" name="nombre1_U" value="<%= u.getNombre1_U() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="nombre2_U">Nombre 2:</label>
                        <input type="text" class="form-control" id="nombre2_U" name="nombre2_U" value="<%= u.getNombre2_U() %>">
                    </div>
                    <div class="form-group">
                        <label for="apellido1_U">Apellido 1:</label>
                        <input type="text" class="form-control" id="apellido1_U" name="apellido1_U" value="<%= u.getApellido1_U() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="apellido2_U">Apellido 2:</label>
                        <input type="text" class="form-control" id="apellido2_U" name="apellido2_U" value="<%= u.getApellido2_U() %>">
                    </div>
                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" class="form-control" id="telefono" name="telefono" value="<%= u.getTelefono() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="correo">Correo:</label>
                        <input type="email" class="form-control" id="correo" name="correo" value="<%= u.getCorreo() %>" required>
                    </div>
                    <div class="form-group">
                        <label for="nuevaContrasena">Contraseña antigua:</label>
                        <input type="password" class="form-control" id="nuevaContrasena" name="nuevaContrasena" value="<%= u.getContrasena()%>">
                    </div>
                    <div class="form-group">
                        <label for="confirmarContrasena">Nueva Contraseña:</label>
                        <input type="password" class="form-control" id="confirmarContrasena" name="confirmarContrasena">
                    </div>
                </form>
                <%
                    }
                %>
            </div>
            <div class="modal-footer">
                <a href="Profile.jsp" class="btn btn-danger">Cancelar</a>
                <button type="submit" class="btn btn-primary" form="editProfileForm">Guardar Cambios</button>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
