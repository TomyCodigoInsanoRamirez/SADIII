
<%@ page import="java.io.IOException" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // Obtener la sesión actual
    HttpSession currentSession = request.getSession(false); // false para no crear una nueva sesión si no existe

    if (currentSession != null) {
        currentSession.invalidate(); // Invalidar la sesión existente
    }

    // Redirigir al usuario a la página de inicio de sesión
    response.sendRedirect("home.jsp");
%>
</body>
</html>
