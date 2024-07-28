package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Productos;
import mx.edu.utez.saditarea.modelo.Usuario;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductosDao {

    public boolean save(Productos producto) {
        boolean rowInserted = false;
        String query = "INSERT INTO Productos (claveProducto, nombreProducto, descripcionProducto) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, producto.getClaveProducto());
            ps.setString(2, producto.getNombreProducto());
            ps.setString(3, producto.getDescripcionProducto());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Productos> getAll() {
        List<Productos> productosList = new ArrayList<>();
        String query = "SELECT * FROM Productos";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String claveProducto = rs.getString("claveProducto");
                String nombreProducto = rs.getString("nombreProducto");
                String descripcionProducto = rs.getString("descripcionProducto");
                int estadoProducto = rs.getInt("estado");
                Productos producto = new Productos(claveProducto, nombreProducto, descripcionProducto,estadoProducto);
                productosList.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }

    public boolean updateOn(String id){
        boolean flag = false;
        String query = "update productos set estado = 1 where claveProducto=?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,id);
            if (ps.executeUpdate()>0){
                //Que si se hizo la modificacion o modificaciones
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
    public boolean updateOf(String id){
        boolean flag = false;
        String query = "update productos set estado = 0 where claveProducto=?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,id);
            if (ps.executeUpdate()>0){
                //Que si se hizo la modificacion o modificaciones
                flag = true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return flag;
    }
}
