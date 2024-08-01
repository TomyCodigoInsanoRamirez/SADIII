package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Entradas;
import mx.edu.utez.saditarea.modelo.Salidas;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SalidasDao {

    public boolean save(Salidas salida) {
        boolean rowInserted = false;
        String query = "INSERT INTO Salidas (folio_S, fk_empleado_S, fk_empleado_E, fk_area, fecha, cantidad_S, fk_claveProducto, fk_unidadMedida) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, salida.getFolio());
            ps.setString(2, salida.getEmpleado_S());
            ps.setString(3, salida.getEmpleado_E());
            ps.setString(4, salida.getArea());
            ps.setDate(5, new java.sql.Date(salida.getFecha().getTime()));
            ps.setInt(6, salida.getCantidad_S());
            ps.setString(7, salida.getClaveProducto());
            ps.setString(8, salida.getUnidadMedida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }

    public List<Salidas> getAll() {
        List<Salidas> productosList = new ArrayList<>();
        String query = "SELECT * FROM Salidas";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                String folio_S = rs.getString("folio_S");
                String fk_empleado_S = rs.getString("fk_empleado_S");
                String fk_empleado_E = rs.getString("fk_empleado_E");
                String fk_area = rs.getString("fk_area");
                Date fecha = rs.getDate("fecha");
                int cantidad_S = rs.getInt("cantidad_S");
                String claveProducto = rs.getString("fk_claveProducto");
                String unidadMedida = rs.getString("fk_unidadMedida");
                Salidas salida = new Salidas(folio_S,fk_empleado_S,fk_empleado_E,fk_area,fecha,cantidad_S,claveProducto,unidadMedida);
                productosList.add(salida);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return productosList;
    }
}
