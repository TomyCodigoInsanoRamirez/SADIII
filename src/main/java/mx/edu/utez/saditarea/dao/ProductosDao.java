package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Productos;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductosDao {

    public boolean save(Productos producto) {
        boolean rowInserted = false;
        String query = "INSERT INTO Productos (nombreProducto, descripcionProducto) VALUES (?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, producto.getNombreProducto());
            ps.setString(2, producto.getDescripcionProducto());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Productos> getAll() {
        List<Productos> productosList = new ArrayList<>();
        String query = "SELECT id, nombreProducto, descripcionProducto FROM Productos";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("id");
                String nombreProducto = rs.getString("nombreProducto");
                String descripcionProducto = rs.getString("descripcionProducto");
                Productos producto = new Productos(id, nombreProducto, descripcionProducto);
                productosList.add(producto);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }
}
