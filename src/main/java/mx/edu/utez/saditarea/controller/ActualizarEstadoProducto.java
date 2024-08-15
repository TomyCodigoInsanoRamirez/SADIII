package mx.edu.utez.saditarea.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.saditarea.dao.ProductosDao;
import mx.edu.utez.saditarea.dao.UserDao;
import mx.edu.utez.saditarea.modelo.Usuario;

import javax.swing.*;
import java.io.IOException;

@WebServlet(name = "ActualizarEstadoProducto",value = "/ActualizarEstadoProducto")
public class ActualizarEstadoProducto extends HttpServlet {
    @Override
    public void init() throws ServletException {

    }
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("Si llega la base de datos el update estado");
        String id = req.getParameter("id");
        int estado = Integer.parseInt(req.getParameter("estado"));
        System.out.println("El estado de este producto es :"+estado);
        System.out.println("El id del producto es :"+id);
        ProductosDao dao = new ProductosDao();
        String action;
        if(estado == 1){
            dao.updateOf(id);
            action = "desactivado";
        }else{
            dao.updateOn(id);
            action = "activado";
        }
        resp.sendRedirect("productos.jsp?action=" + action);

    }
}