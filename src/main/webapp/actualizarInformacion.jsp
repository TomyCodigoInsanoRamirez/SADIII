<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>
<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Actualizar Información</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
<div class="container mt-5">
    <%
        // Obtener los parámetros del formulario
        String userId = request.getParameter("userId");
        String nombre1_U = request.getParameter("nombre1_U");
        String nombre2_U = request.getParameter("nombre2_U");
        String apellido1_U = request.getParameter("apellido1_U");
        String apellido2_U = request.getParameter("apellido2_U");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String confirmarContrasena = request.getParameter("confirmarContrasena");

        // Inicializar el DAO y obtener el usuario
        UserDao dao = new UserDao();

        // Asegúrate de que el userId se maneje como String
        Usuario usuario = dao.getById(userId);

        if (usuario != null) {
            usuario.setNombre1_U(nombre1_U);
            usuario.setNombre2_U(nombre2_U);
            usuario.setApellido1_U(apellido1_U);
            usuario.setApellido2_U(apellido2_U);
            usuario.setTelefono(telefono);
            usuario.setCorreo(correo);

            // Verifica si se ha cambiado la contraseña
            if (contrasena != null && !contrasena.isEmpty()) {
                if (contrasena.equals(confirmarContrasena)) {
                    dao.updatePassword(userId, contrasena);
                } else {
                    // Manejo de error para contraseñas no coincidentes

                }
            }

            // Actualiza la información del usuario sin cambiar la contraseña
            dao.update(usuario);

            // Redirigir a una página de éxito o al perfil del usuario
            response.sendRedirect("Profile.jsp");
        } else {
            // Manejo de error si el usuario no se encuentra

        }
    %>


</div>
response.sendRedirect(ruta);
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
        integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
</body>
</html>
