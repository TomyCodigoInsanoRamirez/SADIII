
<%@ page import="java.io.IOException" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="icon" href="img/apple-touch-icon.png" type="image/png">

<body>
<%
    // Obtener la sesión actual
    HttpSession currentSession = request.getSession(false); // false para no crear una nueva sesión si no existe

    if (currentSession != null) {
        currentSession.invalidate(); // Invalidar la sesión existente
    }

    // Redirigir al usuario a la página de inicio de sesión
    response.sendRedirect("index.jsp");
%>

<script>
    // Recuperamos el rol del usuario desde Local Storage
    const userRole = localStorage.getItem('userRole');
    const userName = localStorage.getItem('userName');

    // Mostramos el rol en la consola (o puedes usarlo para personalizar la UI)
    console.log('User Role:', userRole);
    console.log('User Name:', userName);

    // Si deseas hacer algo basado en el rol del usuario
    if (userRole === 'Administrador') {
        // Lógica específica para el administrador
    } else if (userRole === 'Almacenista') {
        // Lógica específica para el almacenista
    }
</script>

</body>
</html>
