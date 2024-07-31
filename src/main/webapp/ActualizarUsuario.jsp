<%@ page import="mx.edu.utez.saditarea.dao.AreasDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Areas" %>
<%@ page import="mx.edu.utez.saditarea.dao.UserDao" %>
<%@ page import="mx.edu.utez.saditarea.modelo.Usuario" %>

<%
    // Obtener datos del formulario
    String Id = request.getParameter("id_empleado");
    String Nombre1_U = request.getParameter("nombre1_U");
    String Nombre2_U = request.getParameter("nombre2_U");
    String Apellido1_U = request.getParameter("apellido1_U");
    String Apellido2_U = request.getParameter("apellido2_U");
    String Telefono = request.getParameter("telefono_U");
    String Correo = request.getParameter("correo");
    String Rol = request.getParameter("rol");
    System.out.println("El id es: "+Id);
    System.out.println("El nombre es: "+Nombre1_U);
    System.out.println("El nombre es: "+Nombre2_U);
    System.out.println("El apellido es: "+Apellido1_U);
    System.out.println("El apellido es: "+Apellido2_U);
    System.out.println("El telefono es: "+Telefono);
    System.out.println("El correo es: "+Correo);
    System.out.println("El rol es: "+Rol);

    // Crear objeto Areas con los datos del formulario
    Usuario usuario = new Usuario();
    usuario.setId(Id);
    usuario.setNombre1_U(Nombre1_U);
    usuario.setNombre2_U(Nombre2_U);
    usuario.setApellido1_U(Apellido1_U);
    usuario.setApellido2_U(Apellido2_U);
    usuario.setCorreo(Correo);
    usuario.setTelefono(Telefono);
    usuario.setRol(Rol);


    // Crear instancia del DAO para actualizar el área
    UserDao dao = new UserDao();
    //dao.update(usuario);
    //boolean actualizado = dao.update(usuario);

    // Redirigir a la lista de áreas después de la actualización
    if (dao.update(usuario)) {
        response.sendRedirect("home.jsp");
    } else {
        System.out.println("Error al actualizar el usuario.");
    }
%>
