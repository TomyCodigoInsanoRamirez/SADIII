package mx.edu.utez.saditarea.utils;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
@WebFilter(urlPatterns = {
        "/home.jsp",
        "/areas.jsp",
        "/proveedores.jsp",
        "/productos.jsp",
        "/unidadMedida.jsp",
        "/entradas.jsp",
        "/salidas"
}) //Direcciones que va a proteger este filtro
public class AdminSessionFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        //Obtener la sesión
        HttpSession session = httpRequest.getSession(false);
        System.out.println("Esto es lo que imprime la variable sesión al ser creada con false: "+session);
        // Checar si la sesión tiene un atributo “tipoSesion” con valor “admin” (convertido a
        // booleano en este caso)
        boolean isAdmin = false;
        if (session != null) {
            //isAdmin = session.getAttribute("tipoSesion").equals("admin");
            //Object tipoSesion = session.getAttribute("tipoSesion");
            if (session.getAttribute("tipoSesion") != null && session.getAttribute("tipoSesion").equals("admin")) {
                isAdmin = true;
            }
        }
        if (isAdmin) {//Si es administrador la siguiente línea otorga acceso al recurso solicitado
            chain.doFilter(request, response);
        } else {// Si no lo redirigimos a una página de acceso denegado
            httpResponse.sendRedirect("error.jsp");
        }
    }
}