package mx.edu.utez.saditarea.dao;

import mx.edu.utez.saditarea.modelo.Entradas;
import mx.edu.utez.saditarea.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EntradasDao {

    public boolean save(Entradas entrada) {
        boolean rowInserted = false;
        String query = "INSERT INTO entradas (folio_E, numero_Factura, Fecha, RFC, precio_Unitario, precio_Total, cantidad, clave_Producto, id_Empleado, unidad_Medida) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, entrada.getFolio_E());
            ps.setString(2, entrada.getNumero_Factura());
            ps.setDate(3, new java.sql.Date(entrada.getFecha().getTime()));
            ps.setString(4, entrada.getRFC());
            ps.setBoolean(5, entrada.isPrecio_Unitario());
            ps.setBoolean(6, entrada.isPrecio_Total());
            ps.setInt(7, entrada.getCantidad());
            ps.setString(8, entrada.getClave_Producto());
            ps.setInt(9, entrada.getId_Empleado());
            ps.setString(10, entrada.getUnidad_Medida());

            rowInserted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowInserted;
    }
}
